module Homebrew
  class FormulaLoader
    def self.load_formulas(name, result = [])
      formula = Formulary.factory(name)
      result << formula.name
      formula.deps.each do |dependency|
        load_formulas(dependency.name, result)
      end
      result
    end
  end
end
