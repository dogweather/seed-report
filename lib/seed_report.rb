require "seed_report/version"

module SeedReport
  class << self
    def for_model(model, &block)
      initial_count = model.count
      output_heading(model)
      output_initial_count(initial_count)
      block.call
      output_increased_count(model.count - initial_count)
    end

    def output_heading(model)
      print heading(model)
    end

    def output_initial_count(count)
      print initial_count_display(count)
    end

    def output_increased_count(count)
      puts increased_count_display(count)
    end

    def heading(model)
      sprintf("%-16s", model.name) + " "
    end

    def initial_count_display(count)
      "initial count: #{sprintf("%3d", count)}"
    end

    def increased_count_display(amount)
      amount_str = sprintf("%3d", amount)
      amount_colored = amount > 0 ? cyan(amount_str) : amount_str
      ", #{amount_colored} created"
    end

    def cyan(a_string)
      "\e[36m#{a_string}\e[0m"
    end
  end
end
