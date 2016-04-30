module Falsey
  def to_s
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
