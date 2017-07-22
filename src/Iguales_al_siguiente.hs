-- Iguales_al_siguiente.hs
-- Iguales al siguiente.
-- José A. Alonso Jiménez <jalonso@us.es>
-- Sevilla, 21 de Abril de 2014
-- ---------------------------------------------------------------------

-- ---------------------------------------------------------------------
-- | Definir la función
--    igualesAlSiguiente :: Eq a => [a] -> [a]
-- tal que (igualesAlSiguiente xs) es la lista de los elementos de xs
-- que son iguales a su siguiente. Por ejemplo,
--
-- >>> igualesAlSiguiente [1,2,2,2,3,3,4::Int]
-- [2,2,3]
-- >>> igualesAlSiguiente [1..10::Int]
-- []
-- 
-- ---------------------------------------------------------------------

module Iguales_al_siguiente where

import Data.List (group)

-- | 1ª definición (por comprensión):
igualesAlSiguiente :: Eq a => [a] -> [a]
igualesAlSiguiente xs =
  [x | (x,y) <- zip xs (tail xs), x == y]

-- | 2ª definición (por recursión)
--
-- >>> igualesAlSiguiente2 [1,2,2,2,3,3,4::Int]
-- [2,2,3]
-- >>> igualesAlSiguiente2 [1..10::Int]
-- []
igualesAlSiguiente2 :: Eq a => [a] -> [a]
igualesAlSiguiente2 (x:y:zs)
  | x == y    = x : igualesAlSiguiente2 (y:zs)
  | otherwise = igualesAlSiguiente2 (y:zs)
igualesAlSiguiente2 _ = []

-- | 3ª definición (con concat y comprensión)
--
-- >>> igualesAlSiguiente3 [1,2,2,2,3,3,4::Int]
-- [2,2,3]
-- >>> igualesAlSiguiente3 [1..10::Int]
-- []
igualesAlSiguiente3 :: Eq a => [a] -> [a]
igualesAlSiguiente3 xs = concat [ys | (_:ys) <- group xs]

-- | 4ª definición (con concatMap)
--
-- >>> igualesAlSiguiente4 [1,2,2,2,3,3,4::Int]
-- [2,2,3]
-- >>> igualesAlSiguiente4 [1..10::Int]
-- []
igualesAlSiguiente4 :: Eq a => [a] -> [a]
igualesAlSiguiente4 xs = concatMap tail (group xs)

-- | 5ª definición (con concatMap y sin argumentos):
--
-- >>> igualesAlSiguiente5 [1,2,2,2,3,3,4::Int]
-- [2,2,3]
-- >>> igualesAlSiguiente5 [1..10::Int]
-- []
igualesAlSiguiente5 :: Eq a => [a] -> [a]
igualesAlSiguiente5 = concatMap tail . group
