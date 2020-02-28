module Control.DeepSeq.Instances where

import Control.Concurrent.STM.TVar

import Control.DeepSeq

import Data.Array.Unboxed

import Foreign.ForeignPtr

instance (NFData i, NFData e) => NFData (UArray i e) where
    rnf = rwhnf

instance (NFData i) => NFData1 (UArray i) where
    liftRnf _ = rwhnf

instance NFData2 UArray where
    liftRnf2 _ _ = rwhnf

instance NFData (TVar a) where
    rnf = rwhnf

instance NFData1 TVar where
    liftRnf _ = rwhnf

instance NFData (ForeignPtr a) where
    rnf = rwhnf

instance NFData1 ForeignPtr where
    liftRnf _ = rwhnf
