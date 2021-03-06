Require Import GeoCoq.Axioms.parallel_postulates.
Require Import GeoCoq.Tarski_dev.Ch12_parallel.

Section SPP_ID.

Context `{T2D:Tarski_2D}.

Lemma strong_parallel_postulate_implies_inter_dec :
  SPP ->
  decidability_of_intersection.
Proof.
intros HSPP S Q P U.
elim (Col_dec P Q S); intro HPQS; [left; exists P; Col|].
elim (eq_dec_points P U); intro HPU; treat_equalities; [left; exists Q; Col|].
assert (H := midpoint_existence P Q); destruct H as [T [HPTQ HCong1]].
assert (H := symmetric_point_construction S T); destruct H as [R [HRTS HCong2]].
elim (Col_dec P R U); intro HPRU.

  {
  assert (HPar : Par_strict Q S P U).
    {
    apply par_strict_col_par_strict with R; Col.
    apply par_not_col_strict with P; Col.
    apply l12_17 with T; assert_diffs; Col; split; Between; Cong.
    }
  destruct HPar as [H1 [H2 [H3 H]]].
  right; intro HI; apply H.
  destruct HI as [I [HCol1 HCol2]]; exists I; Col.
  }

  {
  assert (H : BetS R T S); try (clear HRTS; rename H into HRTS).
    {
    split; Between.
    split; try (intro; treat_equalities; assert_cols; Col).
    }
  assert (H : BetS P T Q); try (clear HPTQ; rename H into HPTQ).
    {
    split; Col.
    split; try (intro; treat_equalities; Col).
    }
  assert (HI := HSPP P Q R S T U); destruct HI as [I [HCol1 HCol2]]; Cong;
  try (left; exists I; Col); apply all_coplanar.
  }
Qed.

End SPP_ID.
