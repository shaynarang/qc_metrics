FactoryGirl.define do
  factory :sample do |f|
    f.identifier "9099-RG-20"
    f.total_reads 50000
    f.average_q_score 25
    f.percent_five_x_coverage 95
    f.percent_ten_x_coverage 80
    f.percent_twenty_x_coverage 70
    f.percent_thirty_x_coverage 60
  end
end