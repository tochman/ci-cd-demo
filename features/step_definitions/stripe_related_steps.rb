Then('I fill in the payment form') do
  card_no = '42'
  stripe_iframe = find("iframe[name='__privateStripeFrame4']", visible: false)
  within_frame stripe_iframe do
      card_field = find_field('cardnumber')
      card_field.native.clear
      8.times { sleep 0.1; card_field.send_keys(right: card_no); sleep 0.1; }
  
      find_field('exp-date').send_keys('1221')
      find_field('cvc').send_keys('123')
  end
end

Given("I submit the payment form") do
  click_on 'Submit Payment'
  sleep 3
end

Given("I pay for the subscription") do
  steps %{
    And I fill in the payment form
    And I submit the payment form
  }
end