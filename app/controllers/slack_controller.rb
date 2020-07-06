class SlackController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    arr_a = [1, 4, 2]
    arr_b = [4, 5, 3]

    sorted_arr_a = arr_a.sort
    sorted_arr_b = arr_b.sort.reverse

    res = 0
    sorted_arr_a.each_with_index do |a_node, idx|
      res += a_node * sorted_arr_b[idx]
    end

    render json: {
        sorted_arr_a: sorted_arr_a,
        sorted_arr_b: sorted_arr_b,
        res: res
    }

  end

  def create
    render plain: 'hello'
  end
end
