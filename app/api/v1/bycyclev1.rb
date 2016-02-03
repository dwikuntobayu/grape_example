module API

  class BycycleV1 < Grape::API
    prefix "v1"
    format :json

    http_basic do |username, password|
      #api grape only know base64 encode
      #Base64.urlsafe_encode64(username)
      user = User.where(username: username).first
      user.authorized? password unless user.blank?
    end

    resource :bycycles do

      desc "Get all bycycles"
      get '/' do
        @bycycles = Bycycle.all
        {bycycles: @bycycles, total: @bycycles.count, status: 200}
      end

      desc "Add new bycycle"
      post '/' do
        if Bycycle.create!({name: params[:name], series: params[:series]})
          {status: 200, message: "Success add bycyle"}
        else
          {status: 400, message: "Fails add bycycle"}
        end
      end

      desc "Show a bycycle"
      get '/:id' do
        @bycycle = Bycycle.find_by_id params[:id]
        if @bycycle.present?
          {bycycles: @bycycle, message: "Found", status: 200}
        else
          {bycycles: @bycycle, message: "Empty", status: 400}
        end
      end

      desc "Update a bycycle"
      put '/:id' do
      @bycycle = Bycycle.find_by_id(params[:id])
      if @bycycle.update({name: params[:name], series: params[:series]})
        {status: 200, message: "Success update bycycle"}
      else
        {status: 400, message: "Fails update bycycle"}
      end
      end

      desc "Delete a data"
      delete '/:id' do
        begin
          @bycycle = Bycycle.find_by_id(params[:id])
          if @bycycle.destroy
            {status: 200, message: "Success delete bycycle"}
          else
            {status: 400, message: "Fails delete bycycle"}
          end
        rescue
          {status: 400, message: "Bycycle not found"}
        end
      end

    end
  end
end