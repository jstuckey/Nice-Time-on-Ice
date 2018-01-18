# Make an object behave like it's False
# Made to be used by null objects
module Falsey
  def to_s
    ""
  end

  def to_str
    ""
  end

  def present?
    false
  end

  def empty?
    true
  end

  def blank?
    true
  end
end
