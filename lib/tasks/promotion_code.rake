# frozen_string_literal: true

# rake promotion_code:generate
# PromotionCode.all
namespace :promotion_code do
  desc 'Insert records into promotion_code'
  task generate: :environment do
    10.times do
      code = SecureRandom.alphanumeric(7).upcase
      PromotionCode.create!(
        code:,
        discount: (rand(2..20) * 50).round(-2)
      )
    end
  end
end
