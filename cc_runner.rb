require 'collateral_cucumber'
cc = CollateralCucumber.new('./features/gherkin', "@regression")
cc.exec
