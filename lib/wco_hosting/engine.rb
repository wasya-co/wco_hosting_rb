
module Wco
end

module WcoHosting
end

class WcoHosting::Engine < ::Rails::Engine
  isolate_namespace WcoHosting
  isolate_namespace Wco
end
