persons_income = [
  {
    first_name: 'Johnny',
    last_name: 'Smith',
    annual_income: 120000,
    tax_paid: 28000
  },
  {
    first_name: 'Liz',
    last_name: 'Lemon',
    annual_income: 95000,
    tax_paid: 21000
  },
  {
    first_name: 'Jane',
    last_name: 'Doe',
    annual_income: 140000,
    tax_paid: 30000
  },
  {
    first_name: 'Mike',
    last_name: 'Orsillio',
    annual_income: 40000,
    tax_paid: 8800
  }
]

class TaxCalulation

  def initialize(persons_data)
    @name_and_income = persons_data
    @tax_due = []
  end

  def liability
  @name_and_income.each do |name|
    tax_due = name[:annual_income] * 0.22
    if tax_due < name[:tax_paid]
      puts "#{name[:first_name]} #{name[:last_name]} has a tax liability of #{tax_due.to_i}."
      each_person_tax_due = {first_name: name[:first_name], last_name: name[:last_name], tax_due: tax_due, tax_paid: name[:tax_paid]}
      @tax_due << each_person_tax_due
      get_a_return(tax_due, name[:last_name])
    else 
      puts "#{name[:first_name]} #{name[:last_name]} has a tax liability of #{tax_due.to_i}."
    end
  end
end

  def get_a_return(tax_due, last_name)
    @tax_due.each do |person|
      if last_name == person[:last_name]
        refund_amount = (person[:tax_paid] - person[:tax_due])
        puts "#{person[:first_name]} #{person[:last_name]} will recieve a refund of #{refund_amount.to_i}."
      end
    end
  end
end

person = TaxCalulation.new(persons_income)
person.liability