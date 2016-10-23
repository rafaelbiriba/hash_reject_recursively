class Hash
  def deep_reject(&blk)
    self.dup.deep_reject!(&blk)
  end

  def deep_reject!(&blk)
    self.each do |k, v|
      v.deep_reject!(&blk) if v.is_a?(Hash)
      self.delete(k) if blk.call(k, v)
    end
  end
end
