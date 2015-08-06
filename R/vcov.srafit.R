vcov.srafit <-
function (object, ...) 
{
    stats4::vcov(object$model, ...)
}
