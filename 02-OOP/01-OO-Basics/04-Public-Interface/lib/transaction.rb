# Optional

class Transaction
  def initialize(amount)
    # Initialize amount and date of transaction
    @amout = amount
    @time = Time.now
  end

  def to_s
    # Nicely print transaction infos using Time#strftime.
    @time.strftime("#{amount} euros on %m/%d/%Y at %I:%M%p")
  end
end
