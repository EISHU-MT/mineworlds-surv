core.register_chatcommand("balance", {
	description = "Balance",
	func = function(name, param)
		return true, "Balance: "..bank.get_valueC(name)
	end
})
