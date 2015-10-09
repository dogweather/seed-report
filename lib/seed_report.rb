require "seed_report/version"

module SeedReport
  class << self
    def for_model(model, &block)
      initial_count = model.count
      print "#{heading(model)} #{initial_count_display(initial_count)}"

      block.call

      increase = model.count - initial_count
      puts final_count_display(increase)
    end

    def heading(model)
      sprintf("  %-19s", model.name)
    end

    def initial_count_display(count)
      "initial count: #{sprintf("%3d", count)}"
    end

    def final_count_display(amount)
      ", #{sprintf("%3s", amount)} created"
    end
  end
end
