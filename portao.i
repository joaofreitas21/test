
types
  Estados = {a_abrir, a_fechar, aberto, fechado}

interactor main
 attributes
  [vis] estadoActual: Estados
 actions
  # controlador remoto comandado pelo utilizador do portao
  [vis] Ac
  # sensor que indica que o portao esta completamente aberto
  Ia
  # sensor que indica que o portao esta completamente fechado
  If
 axioms
  [] estadoActual = fechado
  estadoActual = fechado -> [Ac] estadoActual' = a_abrir
  estadoActual = a_abrir -> [Ac] (estadoActual' = a_fechar)
  estadoActual = a_fechar -> [Ac] (estadoActual' = a_abrir)
  estadoActual = a_fechar -> [If] (estadoActual' = fechado)
  estadoActual = a_abrir -> [Ia] (estadoActual' = aberto)
  per(Ia) -> estadoActual = a_abrir
  per(If) -> estadoActual = a_fechar
  estadoActual = aberto -> [Ac] (estadoActual' = a_fechar)


