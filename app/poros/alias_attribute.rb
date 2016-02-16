module AliasAttribute
  def self.alias_attribute(new_attr, old_attr)
    new, old = new_attr.to_sym, old_attr.to_sym
    alias_method(new, old)
    alias_method(:"#{new}=", :"#{old}=")
  end
end
