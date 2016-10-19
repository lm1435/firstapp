module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def disconnect
    end

    protected

      def find_verfied_user
        if verified_user = request.env['warden'].user
          verified_user
        else
          reject_unauthorized_connection
      end
    end
  end
  def connect
    self.current_user = find_verfied_user
  end
end
