local upgradesData = {
	["Old_Notebook"] = {
		BasePrice = 0,
		BaseIncome = 1,
		Components = {
			["CPU"] = {
				[1] = {Price = 100, Currency = "Money", IncomeBonus = 2},
				[2] = {Price = 500, Currency = "Money", IncomeBonus = 4},
				[3] = {Price = 2000, Currency = "Money", IncomeBonus = 10},
				[4] = {Price = 50, Currency = "Gems", IncomeBonus = 12},
				[5] = {Price = 100, Currency = "Gems", IncomeBonus = 15},
			},
			["GPU"] = {
				[1] = {Price = 100, Currency = "Money", IncomeBonus = 2},
				[2] = {Price = 500, Currency = "Money", IncomeBonus = 4},
				[3] = {Price = 3000, Currency = "Money", IncomeBonus = 10},
				[4] = {Price = 75, Currency = "Gems", IncomeBonus = 12},
				[5] = {Price = 150, Currency = "Gems", IncomeBonus = 15},
			},
			["Performance"] = {
				[1] = {Price = 100, Currency = "Money", IncomeBonus = 2},
				[2] = {Price = 500, Currency = "Money", IncomeBonus = 4},
				[3] = {Price = 5000, Currency = "Money", IncomeBonus = 5},
			}
		}
	}, -- <--- TADY JE DŮLEŽITÁ ČÁRKA, KTERÁ ODDĚLUJE POČÍTAČE

	["Better_Notebook"] = {
		BasePrice = 150,
		BaseIncome = 3,
		Components = {
			["CPU"] = {
				[1] = {Price = 300, Currency = "Money", IncomeBonus = 4},
				[2] = {Price = 1000, Currency = "Money", IncomeBonus = 6},
				[3] = {Price = 4000, Currency = "Money", IncomeBonus = 10},
				[4] = {Price = 60, Currency = "Gems", IncomeBonus = 15},
				[5] = {Price = 110, Currency = "Gems", IncomeBonus = 20},
			},
			["GPU"] = {
				[1] = {Price = 300, Currency = "Money", IncomeBonus = 4},
				[2] = {Price = 1000, Currency = "Money", IncomeBonus = 6},
				[3] = {Price = 4000, Currency = "Money", IncomeBonus = 10},
				[4] = {Price = 80, Currency = "Gems", IncomeBonus = 15},
				[5] = {Price = 130, Currency = "Gems", IncomeBonus = 20},
			},
			["Performance"] = {
				[1] = {Price = 100, Currency = "Money", IncomeBonus = 4},
				[2] = {Price = 500, Currency = "Money", IncomeBonus = 6},
				[3] = {Price = 5000, Currency = "Money", IncomeBonus = 10},
			}
		}
	}, -- <--- DRUHÁ ČÁRKA

	["Middle_Class_Notebook"] = {
		BasePrice = 500,
		BaseIncome = 5,
		Components = {
			["CPU"] = {
				[1] = {Price = 1000, Currency = "Money", IncomeBonus = 6},
				[2] = {Price = 3000, Currency = "Money", IncomeBonus = 10},
				[3] = {Price = 10000, Currency = "Money", IncomeBonus = 15},
				[4] = {Price = 100, Currency = "Gems", IncomeBonus = 20},
				[5] = {Price = 150, Currency = "Gems", IncomeBonus = 25},
			},
			["GPU"] = {
				[1] = {Price = 1000, Currency = "Money", IncomeBonus = 6},
				[2] = {Price = 3000, Currency = "Money", IncomeBonus = 10},
				[3] = {Price = 10000, Currency = "Money", IncomeBonus = 15},
				[4] = {Price = 120, Currency = "Gems", IncomeBonus = 20},
				[5] = {Price = 170, Currency = "Gems", IncomeBonus = 25},
			},
			["Performance"] = {
				[1] = {Price = 500, Currency = "Money", IncomeBonus = 6},
				[2] = {Price = 1500, Currency = "Money", IncomeBonus = 10},
				[3] = {Price = 5000, Currency = "Money", IncomeBonus = 15},
			}
		}
	},
	
	["Old_PC"] = {
		BasePrice = 2000,
		BaseIncome = 10,
		Components = {
			["CPU"] = {
				[1] = {Price = 2000, Currency = "Money", IncomeBonus = 10},
				[2] = {Price = 6000, Currency = "Money", IncomeBonus = 15},
				[3] = {Price = 20000, Currency = "Money", IncomeBonus = 20},
				[4] = {Price = 200, Currency = "Gems", IncomeBonus = 25},
				[5] = {Price = 250, Currency = "Gems", IncomeBonus = 30},
			},
			["GPU"] = {
				[1] = {Price = 2000, Currency = "Money", IncomeBonus = 10},
				[2] = {Price = 6000, Currency = "Money", IncomeBonus = 15},
				[3] = {Price = 20000, Currency = "Money", IncomeBonus = 20},
				[4] = {Price = 220, Currency = "Gems", IncomeBonus = 25},
				[5] = {Price = 270, Currency = "Gems", IncomeBonus = 30},
			},
			["Performance"] = {
				[1] = {Price = 1000, Currency = "Money", IncomeBonus = 10},
				[2] = {Price = 3000, Currency = "Money", IncomeBonus = 15},
				[3] = {Price = 10000, Currency = "Money", IncomeBonus = 20},
			}
		}
	},
	["Used_PC"] = {
		BasePrice = 5000,
		BaseIncome = 12,
		Components = {
			["CPU"] = {
				[1] = {Price = 5000, Currency = "Money", IncomeBonus = 12},
				[2] = {Price = 15000, Currency = "Money", IncomeBonus = 18},
				[3] = {Price = 50000, Currency = "Money", IncomeBonus = 24},
				[4] = {Price = 500, Currency = "Gems", IncomeBonus = 30},
				[5] = {Price = 600, Currency = "Gems", IncomeBonus = 36},
			},
			["GPU"] = {
				[1] = {Price = 5000, Currency = "Money", IncomeBonus = 12},
				[2] = {Price = 15000, Currency = "Money", IncomeBonus = 18},
				[3] = {Price = 50000, Currency = "Money", IncomeBonus = 24},
				[4] = {Price = 550, Currency = "Gems", IncomeBonus = 30},
				[5] = {Price = 650, Currency = "Gems", IncomeBonus = 36},
			},
			["Performance"] = {
				[1] = {Price = 2500, Currency = "Money", IncomeBonus = 12},
				[2] = {Price = 7500, Currency = "Money", IncomeBonus = 18},
				[3] = {Price = 25000, Currency = "Money", IncomeBonus = 24},
			}
		}
	},
	
	["Higher_Class_Notebook"] = {
		BasePrice = 10000,
		BaseIncome = 15,
		Components = {
			["CPU"] = {
				[1] = {Price = 10000, Currency = "Money", IncomeBonus = 15},
				[2] = {Price = 30000, Currency = "Money", IncomeBonus = 20},
				[3] = {Price = 100000, Currency = "Money", IncomeBonus = 25},
				[4] = {Price = 1000, Currency = "Gems", IncomeBonus = 30},
				[5] = {Price = 1200, Currency = "Gems", IncomeBonus = 35},
			},
			["GPU"] = {
				[1] = {Price = 10000, Currency = "Money", IncomeBonus = 15},
				[2] = {Price = 30000, Currency = "Money", IncomeBonus = 20},
				[3] = {Price = 100000, Currency = "Money", IncomeBonus = 25},
				[4] = {Price = 1100, Currency = "Gems", IncomeBonus = 30},
				[5] = {Price = 1300, Currency = "Gems", IncomeBonus = 35},
			},
			["Performance"] = {
				[1] = {Price = 5000, Currency = "Money", IncomeBonus = 15},
				[2] = {Price = 15000, Currency = "Money", IncomeBonus = 20},
				[3] = {Price = 50000, Currency = "Money", IncomeBonus = 25},
			}
		}
	},
	
	["Working_PC"] = {
		BasePrice = 50000,
		BaseIncome = 20,
		Components = {
			["CPU"] = {
				[1] = {Price = 25000, Currency = "Money", IncomeBonus = 20},
				[2] = {Price = 75000, Currency = "Money", IncomeBonus = 25},
				[3] = {Price = 250000, Currency = "Money", IncomeBonus = 30},
				[4] = {Price = 2500, Currency = "Gems", IncomeBonus = 35},
				[5] = {Price = 3000, Currency = "Gems", IncomeBonus = 40},
			},
			["GPU"] = {
				[1] = {Price = 25000, Currency = "Money", IncomeBonus = 20},
				[2] = {Price = 75000, Currency = "Money", IncomeBonus = 25},
				[3] = {Price = 250000, Currency = "Money", IncomeBonus = 30},
				[4] = {Price = 2200, Currency = "Gems", IncomeBonus = 35},
				[5] = {Price = 2800, Currency = "Gems", IncomeBonus = 40},
			},
			["Performance"] = {
				[1] = {Price = 10000, Currency = "Money", IncomeBonus = 20},
				[2] = {Price = 30000, Currency = "Money", IncomeBonus = 25},
				[3] = {Price = 100000, Currency = "Money", IncomeBonus = 30},
			}
		}
	},
	
	["Gaming_PC"] = {
		BasePrice = 100000,
		BaseIncome = 30,
		Components = {
			["CPU"] = {
				[1] = {Price = 50000, Currency = "Money", IncomeBonus = 30},
				[2] = {Price = 150000, Currency = "Money", IncomeBonus = 35},
				[3] = {Price = 500000, Currency = "Money", IncomeBonus = 40},
				[4] = {Price = 5000, Currency = "Gems", IncomeBonus = 45},
				[5] = {Price = 6000, Currency = "Gems", IncomeBonus = 50},
			},
			["GPU"] = {
				[1] = {Price = 50000, Currency = "Money", IncomeBonus = 30},
				[2] = {Price = 150000, Currency = "Money", IncomeBonus = 35},
				[3] = {Price = 500000, Currency = "Money", IncomeBonus = 40},
				[4] = {Price = 4500, Currency = "Gems", IncomeBonus = 45},
				[5] = {Price = 5200, Currency = "Gems", IncomeBonus = 50},
			},
			["Performance"] = {
				[1] = {Price = 20000, Currency = "Money", IncomeBonus = 30},
				[2] = {Price = 60000, Currency = "Money", IncomeBonus = 35},
				[3] = {Price = 200000, Currency = "Money", IncomeBonus = 40},
			}
		}
	},
	
	["Small_Server"] = {
		BasePrice = 150000,
		BaseIncome = 40,
		Components = {
			["CPU"] = {
				[1] = {Price = 100000, Currency = "Money", IncomeBonus = 40},
				[2] = {Price = 300000, Currency = "Money", IncomeBonus = 45},
				[3] = {Price = 500000, Currency = "Money", IncomeBonus = 50},
				[4] = {Price = 10000, Currency = "Gems", IncomeBonus = 55},
				[5] = {Price = 12000, Currency = "Gems", IncomeBonus = 60},
			},
			["GPU"] = {
				[1] = {Price = 100000, Currency = "Money", IncomeBonus = 40},
				[2] = {Price = 300000, Currency = "Money", IncomeBonus = 45},
				[3] = {Price = 500000, Currency = "Money", IncomeBonus = 50},
				[4] = {Price = 9000, Currency = "Gems", IncomeBonus = 55},
				[5] = {Price = 10500, Currency = "Gems", IncomeBonus = 60},
			},
			["Performance"] = {
				[1] = {Price = 30000, Currency = "Money", IncomeBonus = 40},
				[2] = {Price = 90000, Currency = "Money", IncomeBonus = 45},
				[3] = {Price = 300000, Currency = "Money", IncomeBonus = 50},
			}
		}
	},
	
	["Medium_Server"] = {
		BasePrice = 300000,
		BaseIncome = 60,
		Components = {
			["CPU"] = {
				[1] = {Price = 200000, Currency = "Money", IncomeBonus = 60},
				[2] = {Price = 600000, Currency = "Money", IncomeBonus = 65},
				[3] = {Price = 700000, Currency = "Money", IncomeBonus = 70},
				[4] = {Price = 15000, Currency = "Gems", IncomeBonus = 75},
				[5] = {Price = 18000, Currency = "Gems", IncomeBonus = 80},
			},
			["GPU"] = {
				[1] = {Price = 200000, Currency = "Money", IncomeBonus = 60},
				[2] = {Price = 600000, Currency = "Money", IncomeBonus = 65},
				[3] = {Price = 700000, Currency = "Money", IncomeBonus = 70},
				[4] = {Price = 12000, Currency = "Gems", IncomeBonus = 75},
				[5] = {Price = 13500, Currency = "Gems", IncomeBonus = 80},
			},
			["Performance"] = {
				[1] = {Price = 60000, Currency = "Money", IncomeBonus = 60},
				[2] = {Price = 180000, Currency = "Money", IncomeBonus = 65},
				[3] = {Price = 600000, Currency = "Money", IncomeBonus = 70},
			}
		}
	},
	
	["Large_Server"] = {
		BasePrice = 600000,
		BaseIncome = 100,
		Components = {
			["CPU"] = {
				[1] = {Price = 400000, Currency = "Money", IncomeBonus = 100},
				[2] = {Price = 1200000, Currency = "Money", IncomeBonus = 105},
				[3] = {Price = 1400000, Currency = "Money", IncomeBonus = 110},
				[4] = {Price = 30000, Currency = "Gems", IncomeBonus = 115},
				[5] = {Price = 36000, Currency = "Gems", IncomeBonus = 120},
			},
			["GPU"] = {
				[1] = {Price = 400000, Currency = "Money", IncomeBonus = 100},
				[2] = {Price = 1200000, Currency = "Money", IncomeBonus = 105},
				[3] = {Price = 1400000, Currency = "Money", IncomeBonus = 110},
				[4] = {Price = 24000, Currency = "Gems", IncomeBonus = 115},
				[5] = {Price = 27000, Currency = "Gems", IncomeBonus = 120},
			},
			["Performance"] = {
				[1] = {Price = 120000, Currency = "Money", IncomeBonus = 100},
				[2] = {Price = 360000, Currency = "Money", IncomeBonus = 105},
				[3] = {Price = 1200000, Currency = "Money", IncomeBonus = 110},
			}
		}
	},
	
	["RightWall"] = {
		BasePrice = 100,
	},
	
	["LeftWall"] = {
		BasePrice = 300,
	},
	
	["FrontWall"] = {
		BasePrice = 500,
	},
	
	["BackWall"] = {
		BasePrice = 700,
	},

	["SecondFloorRightWall"] = {
		BasePrice = 5000
	},

	["SecondFloorLeftWall"] = {
		BasePrice = 6500;
	},

	["SecondFloorFrontWall"] = {
		BasePrice = 9000;
	},

	["SecondFloorBackWall"] = {
		BasePrice = 12500;
	},

	--next upgrades
}

return upgradesData -- Vracíme rovnou naši datovou tabulku