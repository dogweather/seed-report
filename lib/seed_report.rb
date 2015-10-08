require "seed_report/version"

module SeedReport
  class << self
    def for_model(model, &block)
      print "#{heading(model)} #{initial_count_display(model)}"
      initial_count = model.count
      block.call
      increase = model.count - initial_count
      puts final_count_display(increase)
    end

    def heading(model)
      class_name = "#{model.table_name.gsub('_',' ').titleize}..."
      sprintf("  %-19s", class_name)
    end

    def initial_count_display(model)
      "initial count: #{sprintf("%3d", model.count)}"
    end

    def final_count_display(amount)
      ", #{sprintf("%3s", amount)} created"
    end
  end
end
