function op_lazy_ternary(condition, trueFunction, falseFunction)
    if condition then
        return trueFunction()
    else
        return falseFunction()
    end
end
