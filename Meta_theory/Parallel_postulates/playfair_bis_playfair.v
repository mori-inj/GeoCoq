Require Import GeoCoq.Axioms.parallel_postulates.
Require Import GeoCoq.Tarski_dev.Ch12_parallel.

Section playfair_bis_playfair.

Context `{T2D:Tarski_2D}.

Lemma playfair_bis__playfair : alternative_playfair_s_postulate -> playfair_s_postulate.
Proof.
intros playfair_bis.
unfold playfair_s_postulate.
intros A1 A2 B1 B2 C1 C2 P HParAB HPB HParAC HPC.
assert_diffs.
assert(HX := perp_exists P A1 A2).
destruct HX as [X]; auto.
assert_diffs.
assert(HD := perp_exists P P X).
destruct HD as [D]; auto.
assert_diffs.
assert(Perp2 A1 A2 P D P).
  {
  exists X.
  exists P.
  split; Col.
  split; Perp.
  }
assert(Col B1 P D /\ Col B2 P D) by (apply (playfair_bis A1 A2 _ _ _ _ P); Col).
assert(Col C1 P D /\ Col C2 P D) by (apply (playfair_bis A1 A2 _ _ _ _ P); Col).
spliter.
split; apply(col3 P D); Col.
Qed.


End playfair_bis_playfair.