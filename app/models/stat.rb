# Used this as a primitive way to track page views
# No longer used
class Stat < ActiveRecord::Base
  serialize :request_params, Hash
  serialize :request_context, Hash
end
