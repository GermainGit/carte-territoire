class StaticpagesController < ApplicationController
    def show
      render template: "staticpages/#{params[:staticpage]}"
    end

  end
