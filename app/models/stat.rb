class Stat < ActiveRecord::Base
  serialize :request_params, Hash
  serialize :request_context, Hash
end
