class MyHashSet
  attr_accessor :store

  def initialize
    @store = {}
  end

  def insert(el)
    @store[el] = true
  end

  def include?(el)
    @store.include? el
  end

  def delete(el)
    if @store.delete(el)
      true
    else
      false
    end
  end

  def to_a
    @store.keys
  end

  def union(other_set)
    merged = @store.merge(other_set.store)
    new_hash = MyHashSet.new
    new_hash.store = merged
    new_hash
  end

  def intersect(other_set)
    new_hash = MyHashSet.new
    both = @store.keys.select { |elm| other_set.store.include? elm }
    both.each { |key, val| new_hash.store[key] = val }
    new_hash
  end

  def minus(other_set)
    common = intersect(other_set)
    res = @store.delete_if { |key, val| common.include? key }
    new_hash = MyHashSet.new
    new_hash.store = res
    new_hash
  end
end
