class Student
  attr_accessor :first_name,:last_name,:courses

  def initialize(first_name,last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end

  def name
    concated_str = [@first_name,@last_name].join(" ")
  end

  def enroll(new_course)
    return if courses.include?(new_course)
    raise "course would cause conflict!" if has_conflict?(new_course)
    @courses << new_course
    new_course.students << self
  end

  def course_load
    load = Hash.new(0)
    self.courses.each do |course|
      load [course.department] += course.credits
    end
    load
  end

  def has_conflict?(new_course)
    self.courses.any? do |enrolled_course|
      new_course.conflicts_with?(enrolled_course)
    end
  end
end
