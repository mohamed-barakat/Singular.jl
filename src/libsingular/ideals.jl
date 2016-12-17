function id_Delete(I::ideal, R::ring)
   icxx"""id_Delete(&$I, $R);"""
end

function id_Copy(I::ideal, R::ring)
   icxx"""id_Copy($I, $R);"""
end

function idInit(size::Cint, rank = Cint(1))
   icxx"""idInit($size, $rank);"""
end

function setindex!(I::ideal, x::poly, j::Cint) 
   icxx"""$I->m[$j] = $x;"""
end

function getindex(I::ideal, j::Cint) 
   icxx"""(poly) ($I->m[$j]);"""
end

function idIs0(I::ideal)
   icxx"""idIs0($I);"""
end

function idElem(I::ideal)
   icxx"""idElem($I);"""
end

function id_Normalize(I::ideal, R::ring)
   icxx"""id_Normalize($I, $R);"""
end

function idSkipZeroes(I::ideal)
   icxx"""idSkipZeroes($I);"""
end

function ngens(I::ideal) 
   icxx"""(int) IDELEMS($I);"""
end

function ncols(I::matrix) 
  icxx"""(int) MATCOLS($I);"""
end

function nrows(I::matrix) 
  icxx"""(int) MATROWS($I);"""
end

function id_Module2Matrix(I::ideal, R::ring)
   icxx"""id_Module2Matrix($I, $R);"""
end

function getindex(M::matrix, i::Cint, j::Cint) 
  icxx"""(poly) MATELEM($M, $i, $j);"""
end

function mp_Delete(M::matrix, R::ring)
   icxx"""mp_Delete(&$M, $R);"""
end

function iiStringMatrix(I::matrix, d::Cint, R::ring)
   icxx"""iiStringMatrix($I, $d, $R);"""
end

function id_Std(I:: ideal, R::ring)
   icxx"""ideal id = NULL;
          if (!idIs0($I))
          {
             intvec * n = NULL;
             tHomog h = testHomog;
             const ring origin = currRing;
             rChangeCurrRing($R);
             id = kStd($I, $R->qideal, h, &n);
             rChangeCurrRing(origin);
             if (n != NULL)
                delete n;
          } else
             id = idInit(0, $I->rank);
          id;
       """
end

function id_Syzygies(I:: ideal, R::ring)
   icxx"""ideal id = NULL;
          intvec * n = NULL;
          tHomog h = testHomog;
          const ring origin = currRing;
          rChangeCurrRing($R);
          id = idSyzygies($I, h, &n);
          rChangeCurrRing(origin);
          if (n != NULL)
             delete n;
          id;
       """
end