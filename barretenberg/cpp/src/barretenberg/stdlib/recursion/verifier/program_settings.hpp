#pragma once

#include "barretenberg/plonk/proof_system/types/program_settings.hpp"

#include "../transcript/transcript.hpp"

namespace proof_system::plonk {
namespace stdlib {
namespace recursion {

template <typename Curve> class recursive_ultra_verifier_settings : public plonk::ultra_verifier_settings {
  public:
    typedef typename Curve::ScalarField fr_ct;
    typedef typename Curve::GroupNative::affine_element g1;
    typedef typename Curve::Builder Builder;
    typedef proof_system::plonk::stdlib::recursion::Transcript<Builder> Transcript_pt;
    typedef proof_system::plonk::VerifierPermutationWidget<fr_ct, g1, Transcript_pt> PermutationWidget;
    typedef proof_system::plonk::VerifierPlookupWidget<fr_ct, g1, Transcript_pt> PlookupWidget;

    typedef proof_system::plonk::ultra_settings base_settings;

    typedef proof_system::plonk::VerifierPlookupArithmeticWidget<fr_ct, g1, Transcript_pt, base_settings>
        PlookupArithmeticWidget;
    typedef proof_system::plonk::VerifierLogicWidget<fr_ct, g1, Transcript_pt, base_settings> LogicWidget;
    typedef proof_system::plonk::VerifierGenPermSortWidget<fr_ct, g1, Transcript_pt, base_settings> GenPermSortWidget;
    typedef proof_system::plonk::VerifierEllipticWidget<fr_ct, g1, Transcript_pt, base_settings> EllipticWidget;
    typedef proof_system::plonk::VerifierPlookupAuxiliaryWidget<fr_ct, g1, Transcript_pt, base_settings>
        PlookupAuxiliaryWidget;

    static constexpr size_t num_challenge_bytes = 16;
    static constexpr transcript::HashType hash_type = transcript::HashType::PedersenBlake3s;
    // idpolys is a flag that describes whether we're using Vitalik's trick of using trivial identity permutation
    // polynomials (id_poly = false); OR whether the identity permutation polynomials are circuit-specific and stored in
    // the proving/verification key (id_poly = true).
    static constexpr bool idpolys = true;

    static fr_ct append_scalar_multiplication_inputs(typename Transcript_pt::Key* key,
                                                     const fr_ct& alpha_base,
                                                     const Transcript_pt& transcript,
                                                     std::map<std::string, fr_ct>& scalars)
    {
        auto updated_alpha = PermutationWidget::append_scalar_multiplication_inputs(key, alpha_base, transcript);

        updated_alpha = PlookupWidget::append_scalar_multiplication_inputs(key, updated_alpha, transcript, scalars);

        updated_alpha =
            PlookupArithmeticWidget::append_scalar_multiplication_inputs(key, updated_alpha, transcript, scalars);

        updated_alpha = GenPermSortWidget::append_scalar_multiplication_inputs(key, updated_alpha, transcript, scalars);

        updated_alpha = EllipticWidget::append_scalar_multiplication_inputs(key, updated_alpha, transcript, scalars);

        updated_alpha =
            PlookupAuxiliaryWidget::append_scalar_multiplication_inputs(key, updated_alpha, transcript, scalars);

        return updated_alpha;
    }

    static fr_ct compute_quotient_evaluation_contribution(typename Transcript_pt::Key* key,
                                                          const fr_ct& alpha_base,
                                                          const Transcript_pt& transcript,
                                                          fr_ct& quotient_numerator_eval)
    {
        auto updated_alpha_base = PermutationWidget::compute_quotient_evaluation_contribution(
            key, alpha_base, transcript, quotient_numerator_eval, idpolys);

        updated_alpha_base = PlookupWidget::compute_quotient_evaluation_contribution(
            key, updated_alpha_base, transcript, quotient_numerator_eval);

        updated_alpha_base = PlookupArithmeticWidget::compute_quotient_evaluation_contribution(
            key, updated_alpha_base, transcript, quotient_numerator_eval);

        updated_alpha_base = GenPermSortWidget::compute_quotient_evaluation_contribution(
            key, updated_alpha_base, transcript, quotient_numerator_eval);

        updated_alpha_base = EllipticWidget::compute_quotient_evaluation_contribution(
            key, updated_alpha_base, transcript, quotient_numerator_eval);

        updated_alpha_base = PlookupAuxiliaryWidget::compute_quotient_evaluation_contribution(
            key, updated_alpha_base, transcript, quotient_numerator_eval);

        return updated_alpha_base;
    }
};

// Only needed because ultra-to-standard recursion requires us to use a Pedersen hash which is common to both Ultra &
// Standard plonk i.e. the non-ultra version.
template <typename Curve>
class recursive_ultra_to_standard_verifier_settings : public recursive_ultra_verifier_settings<Curve> {
  public:
    typedef typename Curve::ScalarField fr_ct;
    typedef typename Curve::GroupNative::affine_element g1;
    typedef typename Curve::Builder Builder;
    typedef proof_system::plonk::stdlib::recursion::Transcript<Builder> Transcript_pt;
    typedef proof_system::plonk::VerifierPermutationWidget<fr_ct, g1, Transcript_pt> PermutationWidget;
    typedef proof_system::plonk::VerifierPlookupWidget<fr_ct, g1, Transcript_pt> PlookupWidget;

    typedef proof_system::plonk::ultra_to_standard_settings base_settings;

    typedef proof_system::plonk::VerifierPlookupArithmeticWidget<fr_ct, g1, Transcript_pt, base_settings>
        PlookupArithmeticWidget;
    typedef proof_system::plonk::VerifierLogicWidget<fr_ct, g1, Transcript_pt, base_settings> LogicWidget;
    typedef proof_system::plonk::VerifierGenPermSortWidget<fr_ct, g1, Transcript_pt, base_settings> GenPermSortWidget;
    typedef proof_system::plonk::VerifierEllipticWidget<fr_ct, g1, Transcript_pt, base_settings> EllipticWidget;
    typedef proof_system::plonk::VerifierPlookupAuxiliaryWidget<fr_ct, g1, Transcript_pt, base_settings>
        PlookupAuxiliaryWidget;

    static constexpr transcript::HashType hash_type = transcript::HashType::PedersenBlake3s;
};

} // namespace recursion
} // namespace stdlib
} // namespace proof_system::plonk
