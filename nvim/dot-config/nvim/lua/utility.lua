# TODO: change function to use closures
function op_ternary(condition, trueValue, falseValue)
    if condition then
        return trueValue
    else
        return falseValue
    end
end

function op_lazy_ternary(condition, trueFunction, falseFunction)
    if condition then
        return trueFunction()
    else
        return falseFunction()
    end
end
