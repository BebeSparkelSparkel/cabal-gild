-- |
-- License: GPL-3.0-or-later
-- Copyright: Oleg Grenrus
--
-- Fat-prelude.
module CabalGild.Prelude
  ( -- * Control.Arrow
    (&&&),

    -- * Control.Monad
    when,
    unless,
    void,

    -- * Data.Bifunctor
    bimap,

    -- * Data.Char
    toLower,

    -- * Data.Either
    partitionEithers,

    -- * Data.Foldable
    toList,
    traverse_,
    asum,
    for_,

    -- * Data.Function
    on,
    (&),

    -- * Data.List
    intercalate,
    sortOn,
    sortBy,
    nub,

    -- * Data.Maybe
    catMaybes,
    fromMaybe,
    isJust,
    isNothing,

    -- * Packages

    -- ** bytestring
    ByteString,

    -- ** Cabal
    C.fromUTF8BS,
    C.toUTF8BS,
    pack',
    unpack',

    -- ** containers
    Set,

    -- ** directory
    dropExtension,
    splitDirectories,

    -- ** exceptions
    catchError,
    throwError,

    -- * Extras

    -- ** Lens
    traverseOf,
    over,
    view,
    _1,

    -- ** Tuples
    fstOf3,
    sndOf3,
    trdOf3,
  )
where

import Control.Arrow ((&&&))
import Control.Monad (unless, void, when)
import Control.Monad.Except (catchError, throwError)
import Data.Bifunctor (bimap)
import Data.ByteString (ByteString)
import Data.Char (toLower)
import Data.Either (partitionEithers)
import Data.Foldable (asum, for_, toList, traverse_)
import Data.Function (on, (&))
import Data.List (intercalate, nub, sortBy, sortOn)
import Data.Maybe (catMaybes, fromMaybe, isJust, isNothing)
import Data.Set (Set)
import Distribution.Compat.Lens (over, view)
import Distribution.Compat.Newtype (pack', unpack')
import qualified Distribution.Utils.Generic as C
import System.FilePath (dropExtension, splitDirectories)

traverseOf ::
  ((a -> f b) -> s -> f t) ->
  (a -> f b) ->
  s ->
  f t
traverseOf = id

_1 :: (Functor f) => (a -> f b) -> (a, c) -> f (b, c)
_1 f (a, c) = (\b -> (b, c)) <$> f a

fstOf3 :: (a, b, c) -> a
fstOf3 (a, _, _) = a

sndOf3 :: (a, b, c) -> b
sndOf3 (_, b, _) = b

trdOf3 :: (a, b, c) -> c
trdOf3 (_, _, c) = c
