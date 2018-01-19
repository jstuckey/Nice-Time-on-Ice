# Mixin to alias Virtus attributes
# Used by the GameBuilder object
#
# Not really necessary - mostly just for fun
module AliasAttribute
  def self.alias_attribute(new_attr, old_attr)
    new = new_attr.to_sym
    old = old_attr.to_sym

    alias_method(new, old)
    alias_method(:"#{new}=", :"#{old}=")
  end
end
