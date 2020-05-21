class GithubPostingUrlCrawler

  def initialize(commit_history_rss)
    @commit_history_rss = commit_history_rss
  end

  def run
    puts 'start'
    commit_links = extract_commit_commit_links
    new_commit_links = remove_already_exists_history(commit_links)
    new_commit_links&.each do |new_commit_link|
      next unless register_commit_link(new_commit_link)
      posting_infos = extract_posting_infos_from_commit(new_commit_link)
      next unless posting_infos.present?
      register_posting_infos(posting_infos)
    end
    puts 'end'
  end

  private
  def remove_already_exists_history(commit_links)
    commit_links&.select{ |commit_link| !Github::GitCommitHistory.already_exists?(commit_link) }
  end

  def extract_posting_infos_from_commit(commit_link)
    response = HTTParty.get("#{commit_link}?diff=unified")
    diff_html = Nokogiri::HTML(response.body)
    additional_new_content = diff_html.css('td').select{ |td| td['class'].match(/blob-code-addition/)  }
    posting_infos = additional_new_content.map do |new_content|
      posting_link_text = new_content.children.to_s.match(/\[.+\]\((http|https).+\)/)
      next unless posting_link_text.present?
      sanitize_posting_info = ActionView::Base.full_sanitizer.sanitize(posting_link_text.to_s)
      {
        title: sanitize_posting_info.to_s[/\[.+\]/] || 'N/A',
        url: sanitize_posting_info.to_s[/\(.+\)/] || ''
      }
    end
    posting_infos.compact
  end

  def register_posting_infos(posting_infos)
    posting_infos&.each { |posting_info| Post.register(posting_info) }
  end

  def register_commit_link(commit_id)
    Github::GitCommitHistory.register(commit_id)
  end
  def extract_commit_commit_links
    response = HTTParty.get(@commit_history_rss)
    history_xml = Nokogiri::HTML(response.body)
    histories = history_xml.css('entry')
    commit_links = histories.map do |history|
      commit_link = history.children&.css('link')&.attr('href').to_s
      next unless commit_link.present?
      commit_link
    end.compact
    commit_links
  end

  # 트리거는 어떻게 할것인가?? 배치? 명령어?
  # https://github.com/Integerous/goQuality-dev-contents/commits/master.atom 를 이용해서 서버가 알고있는 마지막 커밋 번호와 비교
  # 다르면 가장 오래된 커밋번호부터 위로 가면서 체크체크
  # 일치하는게 나오면 뽑아내고 슬랙으로 푸시
  #
end