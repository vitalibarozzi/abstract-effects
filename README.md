# Abstract effects collection

Collection of computational effects with no particular implementation.

In other words, it contains classes definitions with no instances so it can be instantiated for
any monadic kind of type, so it has classes where the kind ends in:

```haskell
(Type -> Type) -> Constraint
```


### Base
- Continuation
- Input
- Output
- Partial
- State


### Variations
- Random
- Except
- Iterator
- Loop
- List


### Categorical-ish
- Join
- Fix
- Product
- Split
- Contravariant
- SideEffect


### Development/Meta
- Exit
- Generic
- IO
- Quasi
- System
- Test
- Log
- Metric
- Concurrent
- Parser
- Resource


### Thematic
- FileSystem
- Store
- Teletype
- Time


### todo
- Wrap
- Probabilistic
