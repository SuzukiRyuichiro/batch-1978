class EmployeesView
  def display(employee)
    employee.each_with_index do |employee, index|
      puts "#{index + 1}. #{employee.username} : #{employee.role}"
    end
  end
end
