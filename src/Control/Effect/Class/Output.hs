module Control.Effect.Class.Output where


class Output o m where
    tell :: o -> m ()


-- may not be definable here without the handlers, or better saying, the handler is this decision
listen = undefined
