module ModelLog
  class Store
    class << self
      def store
        Thread.current[:model_log_store] ||= {}
      end

      def store=(store)
        Thread.current[:model_log_store] = store
      end

      def read(key)
        store[key]
      end

      def write(key, value)
        store[key] = value
      end

      def delete(key)
        store.delete(key)
      end

      def current_user
        read :current_user
      end

      def current_user=(user)
        write :current_user, user
      end

      def clear_current_user!
        delete :current_user
      end

      def requester
        read :requester
      end

      def requester=(request)
        write :requester, request
      end

      def clear_requester!
        delete :requester
      end
    end
  end
end
