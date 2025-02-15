AUTOMAKE_OPTIONS = foreign

CFLAGS = -Wall -DHAVE_CONFIG_H -Wno-unknown-pragmas

lib_LTLIBRARIES = libtgvoip.la

SRC = VoIPController.cpp \
Buffers.cpp \
CongestionControl.cpp \
EchoCanceller.cpp \
JitterBuffer.cpp \
logging.cpp \
MediaStreamItf.cpp \
MessageThread.cpp \
NetworkSocket.cpp \
OpusDecoder.cpp \
OpusEncoder.cpp \
PacketReassembler.cpp \
VoIPGroupController.cpp \
VoIPServerConfig.cpp \
audio/AudioIO.cpp \
audio/AudioInput.cpp \
audio/AudioOutput.cpp \
audio/Resampler.cpp \
os/posix/NetworkSocketPosix.cpp \
video/VideoSource.cpp \
video/VideoRenderer.cpp \
video/ScreamCongestionController.cpp \
json11.cpp

TGVOIP_HDRS = \
VoIPController.h \
Buffers.h \
BlockingQueue.h \
PrivateDefines.h \
CongestionControl.h \
EchoCanceller.h \
JitterBuffer.h \
logging.h \
threading.h \
MediaStreamItf.h \
MessageThread.h \
NetworkSocket.h \
OpusDecoder.h \
OpusEncoder.h \
PacketReassembler.h \
VoIPServerConfig.h \
audio/AudioIO.h \
audio/AudioInput.h \
audio/AudioOutput.h \
audio/Resampler.h \
os/posix/NetworkSocketPosix.h \
video/VideoSource.h \
video/VideoRenderer.h \
video/ScreamCongestionController.h \
json11.hpp \
utils.h

if TARGET_OS_OSX

SRC += \
os/darwin/AudioInputAudioUnit.cpp \
os/darwin/AudioOutputAudioUnit.cpp \
os/darwin/AudioUnitIO.cpp \
os/darwin/AudioInputAudioUnitOSX.cpp \
os/darwin/AudioOutputAudioUnitOSX.cpp \
os/darwin/DarwinSpecific.mm


TGVOIP_HDRS += \
os/darwin/AudioInputAudioUnit.h \
os/darwin/AudioOutputAudioUnit.h \
os/darwin/AudioUnitIO.h \
os/darwin/AudioInputAudioUnitOSX.h \
os/darwin/AudioOutputAudioUnitOSX.h \
os/darwin/DarwinSpecific.h


LDFLAGS += -framework Foundation -framework CoreFoundation -framework CoreAudio -framework AudioToolbox -framework CoreMedia

else
# Linux-specific

if WITH_ALSA
SRC += \
os/linux/AudioInputALSA.cpp \
os/linux/AudioOutputALSA.cpp
TGVOIP_HDRS += \
os/linux/AudioInputALSA.h \
os/linux/AudioOutputALSA.h
endif

if WITH_PULSE
SRC += \
os/linux/AudioOutputPulse.cpp \
os/linux/AudioInputPulse.cpp \
os/linux/AudioPulse.cpp
TGVOIP_HDRS += \
os/linux/AudioOutputPulse.h \
os/linux/AudioInputPulse.h \
os/linux/AudioPulse.h \
os/linux/PulseFunctions.h
endif
endif

if ENABLE_DSP
CFLAGS += -DWEBRTC_POSIX -DWEBRTC_APM_DEBUG_DUMP=0 -DWEBRTC_NS_FLOAT -I$(top_srcdir)/webrtc_dsp
CCASFLAGS += -I$(top_srcdir)/webrtc_dsp

SRC += \
./webrtc_dsp/system_wrappers/source/field_trial.cc \
./webrtc_dsp/system_wrappers/source/metrics.cc \
./webrtc_dsp/system_wrappers/source/cpu_features.cc \
./webrtc_dsp/absl/strings/internal/memutil.cc \
./webrtc_dsp/absl/strings/string_view.cc \
./webrtc_dsp/absl/strings/ascii.cc \
./webrtc_dsp/absl/types/bad_optional_access.cc \
./webrtc_dsp/absl/types/optional.cc \
./webrtc_dsp/absl/base/internal/raw_logging.cc \
./webrtc_dsp/absl/base/internal/throw_delegate.cc \
./webrtc_dsp/rtc_base/race_checker.cc \
./webrtc_dsp/rtc_base/strings/string_builder.cc \
./webrtc_dsp/rtc_base/memory/aligned_malloc.cc \
./webrtc_dsp/rtc_base/timeutils.cc \
./webrtc_dsp/rtc_base/platform_file.cc \
./webrtc_dsp/rtc_base/string_to_number.cc \
./webrtc_dsp/rtc_base/thread_checker_impl.cc \
./webrtc_dsp/rtc_base/stringencode.cc \
./webrtc_dsp/rtc_base/stringutils.cc \
./webrtc_dsp/rtc_base/checks.cc \
./webrtc_dsp/rtc_base/platform_thread.cc \
./webrtc_dsp/rtc_base/logging_webrtc.cc \
./webrtc_dsp/rtc_base/criticalsection.cc \
./webrtc_dsp/rtc_base/platform_thread_types.cc \
./webrtc_dsp/rtc_base/event.cc \
./webrtc_dsp/rtc_base/event_tracer.cc \
./webrtc_dsp/third_party/rnnoise/src/rnn_vad_weights.cc \
./webrtc_dsp/third_party/rnnoise/src/kiss_fft.cc \
./webrtc_dsp/api/audio/audio_frame.cc \
./webrtc_dsp/api/audio/echo_canceller3_config.cc \
./webrtc_dsp/api/audio/echo_canceller3_factory.cc \
./webrtc_dsp/modules/third_party/fft/fft.c \
./webrtc_dsp/modules/audio_coding/codecs/isac/main/source/pitch_estimator.c \
./webrtc_dsp/modules/audio_coding/codecs/isac/main/source/lpc_shape_swb16_tables.c \
./webrtc_dsp/modules/audio_coding/codecs/isac/main/source/pitch_gain_tables.c \
./webrtc_dsp/modules/audio_coding/codecs/isac/main/source/arith_routines_logist.c \
./webrtc_dsp/modules/audio_coding/codecs/isac/main/source/filterbanks.c \
./webrtc_dsp/modules/audio_coding/codecs/isac/main/source/transform.c \
./webrtc_dsp/modules/audio_coding/codecs/isac/main/source/pitch_filter.c \
./webrtc_dsp/modules/audio_coding/codecs/isac/main/source/encode_lpc_swb.c \
./webrtc_dsp/modules/audio_coding/codecs/isac/main/source/filter_functions.c \
./webrtc_dsp/modules/audio_coding/codecs/isac/main/source/decode.c \
./webrtc_dsp/modules/audio_coding/codecs/isac/main/source/lattice.c \
./webrtc_dsp/modules/audio_coding/codecs/isac/main/source/intialize.c \
./webrtc_dsp/modules/audio_coding/codecs/isac/main/source/lpc_tables.c \
./webrtc_dsp/modules/audio_coding/codecs/isac/main/source/lpc_gain_swb_tables.c \
./webrtc_dsp/modules/audio_coding/codecs/isac/main/source/bandwidth_estimator.c \
./webrtc_dsp/modules/audio_coding/codecs/isac/main/source/encode.c \
./webrtc_dsp/modules/audio_coding/codecs/isac/main/source/lpc_analysis.c \
./webrtc_dsp/modules/audio_coding/codecs/isac/main/source/arith_routines_hist.c \
./webrtc_dsp/modules/audio_coding/codecs/isac/main/source/entropy_coding.c \
./webrtc_dsp/modules/audio_coding/codecs/isac/main/source/isac_vad.c \
./webrtc_dsp/modules/audio_coding/codecs/isac/main/source/arith_routines.c \
./webrtc_dsp/modules/audio_coding/codecs/isac/main/source/crc.c \
./webrtc_dsp/modules/audio_coding/codecs/isac/main/source/lpc_shape_swb12_tables.c \
./webrtc_dsp/modules/audio_coding/codecs/isac/main/source/decode_bwe.c \
./webrtc_dsp/modules/audio_coding/codecs/isac/main/source/spectrum_ar_model_tables.c \
./webrtc_dsp/modules/audio_coding/codecs/isac/main/source/pitch_lag_tables.c \
./webrtc_dsp/modules/audio_coding/codecs/isac/main/source/isac.c \
./webrtc_dsp/modules/audio_processing/rms_level.cc \
./webrtc_dsp/modules/audio_processing/echo_detector/normalized_covariance_estimator.cc \
./webrtc_dsp/modules/audio_processing/echo_detector/moving_max.cc \
./webrtc_dsp/modules/audio_processing/echo_detector/circular_buffer.cc \
./webrtc_dsp/modules/audio_processing/echo_detector/mean_variance_estimator.cc \
./webrtc_dsp/modules/audio_processing/splitting_filter.cc \
./webrtc_dsp/modules/audio_processing/gain_control_impl.cc \
./webrtc_dsp/modules/audio_processing/ns/nsx_core.c \
./webrtc_dsp/modules/audio_processing/ns/noise_suppression_x.c \
./webrtc_dsp/modules/audio_processing/ns/nsx_core_c.c \
./webrtc_dsp/modules/audio_processing/ns/ns_core.c \
./webrtc_dsp/modules/audio_processing/ns/noise_suppression.c \
./webrtc_dsp/modules/audio_processing/audio_buffer.cc \
./webrtc_dsp/modules/audio_processing/typing_detection.cc \
./webrtc_dsp/modules/audio_processing/include/audio_processing_statistics.cc \
./webrtc_dsp/modules/audio_processing/include/audio_generator_factory.cc \
./webrtc_dsp/modules/audio_processing/include/aec_dump.cc \
./webrtc_dsp/modules/audio_processing/include/audio_processing.cc \
./webrtc_dsp/modules/audio_processing/include/config.cc \
./webrtc_dsp/modules/audio_processing/agc2/interpolated_gain_curve.cc \
./webrtc_dsp/modules/audio_processing/agc2/agc2_common.cc \
./webrtc_dsp/modules/audio_processing/agc2/gain_applier.cc \
./webrtc_dsp/modules/audio_processing/agc2/adaptive_agc.cc \
./webrtc_dsp/modules/audio_processing/agc2/adaptive_digital_gain_applier.cc \
./webrtc_dsp/modules/audio_processing/agc2/limiter.cc \
./webrtc_dsp/modules/audio_processing/agc2/saturation_protector.cc \
./webrtc_dsp/modules/audio_processing/agc2/rnn_vad/spectral_features_internal.cc \
./webrtc_dsp/modules/audio_processing/agc2/rnn_vad/rnn.cc \
./webrtc_dsp/modules/audio_processing/agc2/rnn_vad/pitch_search_internal.cc \
./webrtc_dsp/modules/audio_processing/agc2/rnn_vad/spectral_features.cc \
./webrtc_dsp/modules/audio_processing/agc2/rnn_vad/pitch_search.cc \
./webrtc_dsp/modules/audio_processing/agc2/rnn_vad/features_extraction.cc \
./webrtc_dsp/modules/audio_processing/agc2/rnn_vad/fft_util.cc \
./webrtc_dsp/modules/audio_processing/agc2/rnn_vad/lp_residual.cc \
./webrtc_dsp/modules/audio_processing/agc2/adaptive_mode_level_estimator_agc.cc \
./webrtc_dsp/modules/audio_processing/agc2/vector_float_frame.cc \
./webrtc_dsp/modules/audio_processing/agc2/noise_level_estimator.cc \
./webrtc_dsp/modules/audio_processing/agc2/agc2_testing_common.cc \
./webrtc_dsp/modules/audio_processing/agc2/fixed_digital_level_estimator.cc \
./webrtc_dsp/modules/audio_processing/agc2/fixed_gain_controller.cc \
./webrtc_dsp/modules/audio_processing/agc2/vad_with_level.cc \
./webrtc_dsp/modules/audio_processing/agc2/limiter_db_gain_curve.cc \
./webrtc_dsp/modules/audio_processing/agc2/down_sampler.cc \
./webrtc_dsp/modules/audio_processing/agc2/signal_classifier.cc \
./webrtc_dsp/modules/audio_processing/agc2/noise_spectrum_estimator.cc \
./webrtc_dsp/modules/audio_processing/agc2/compute_interpolated_gain_curve.cc \
./webrtc_dsp/modules/audio_processing/agc2/biquad_filter.cc \
./webrtc_dsp/modules/audio_processing/agc2/adaptive_mode_level_estimator.cc \
./webrtc_dsp/modules/audio_processing/transient/moving_moments.cc \
./webrtc_dsp/modules/audio_processing/transient/wpd_tree.cc \
./webrtc_dsp/modules/audio_processing/transient/wpd_node.cc \
./webrtc_dsp/modules/audio_processing/transient/transient_suppressor.cc \
./webrtc_dsp/modules/audio_processing/transient/transient_detector.cc \
./webrtc_dsp/modules/audio_processing/low_cut_filter.cc \
./webrtc_dsp/modules/audio_processing/level_estimator_impl.cc \
./webrtc_dsp/modules/audio_processing/three_band_filter_bank.cc \
./webrtc_dsp/modules/audio_processing/aec/echo_cancellation.cc \
./webrtc_dsp/modules/audio_processing/aec/aec_resampler.cc \
./webrtc_dsp/modules/audio_processing/aec/aec_core.cc \
./webrtc_dsp/modules/audio_processing/voice_detection_impl.cc \
./webrtc_dsp/modules/audio_processing/echo_cancellation_impl.cc \
./webrtc_dsp/modules/audio_processing/gain_control_for_experimental_agc.cc \
./webrtc_dsp/modules/audio_processing/agc/agc.cc \
./webrtc_dsp/modules/audio_processing/agc/loudness_histogram.cc \
./webrtc_dsp/modules/audio_processing/agc/agc_manager_direct.cc \
./webrtc_dsp/modules/audio_processing/agc/legacy/analog_agc.c \
./webrtc_dsp/modules/audio_processing/agc/legacy/digital_agc.c \
./webrtc_dsp/modules/audio_processing/agc/utility.cc \
./webrtc_dsp/modules/audio_processing/audio_processing_impl.cc \
./webrtc_dsp/modules/audio_processing/audio_generator/file_audio_generator.cc \
./webrtc_dsp/modules/audio_processing/gain_controller2.cc \
./webrtc_dsp/modules/audio_processing/residual_echo_detector.cc \
./webrtc_dsp/modules/audio_processing/noise_suppression_impl.cc \
./webrtc_dsp/modules/audio_processing/aecm/aecm_core.cc \
./webrtc_dsp/modules/audio_processing/aecm/aecm_core_c.cc \
./webrtc_dsp/modules/audio_processing/aecm/echo_control_mobile.cc \
./webrtc_dsp/modules/audio_processing/aec3/render_reverb_model.cc \
./webrtc_dsp/modules/audio_processing/aec3/reverb_model_fallback.cc \
./webrtc_dsp/modules/audio_processing/aec3/echo_remover_metrics.cc \
./webrtc_dsp/modules/audio_processing/aec3/matched_filter_lag_aggregator.cc \
./webrtc_dsp/modules/audio_processing/aec3/render_delay_buffer2.cc \
./webrtc_dsp/modules/audio_processing/aec3/echo_path_variability.cc \
./webrtc_dsp/modules/audio_processing/aec3/frame_blocker.cc \
./webrtc_dsp/modules/audio_processing/aec3/subtractor.cc \
./webrtc_dsp/modules/audio_processing/aec3/aec3_fft.cc \
./webrtc_dsp/modules/audio_processing/aec3/fullband_erle_estimator.cc \
./webrtc_dsp/modules/audio_processing/aec3/suppression_filter.cc \
./webrtc_dsp/modules/audio_processing/aec3/block_processor.cc \
./webrtc_dsp/modules/audio_processing/aec3/subband_erle_estimator.cc \
./webrtc_dsp/modules/audio_processing/aec3/render_delay_controller_metrics.cc \
./webrtc_dsp/modules/audio_processing/aec3/render_delay_buffer.cc \
./webrtc_dsp/modules/audio_processing/aec3/vector_buffer.cc \
./webrtc_dsp/modules/audio_processing/aec3/erl_estimator.cc \
./webrtc_dsp/modules/audio_processing/aec3/aec_state.cc \
./webrtc_dsp/modules/audio_processing/aec3/adaptive_fir_filter.cc \
./webrtc_dsp/modules/audio_processing/aec3/render_delay_controller.cc \
./webrtc_dsp/modules/audio_processing/aec3/skew_estimator.cc \
./webrtc_dsp/modules/audio_processing/aec3/echo_path_delay_estimator.cc \
./webrtc_dsp/modules/audio_processing/aec3/block_framer.cc \
./webrtc_dsp/modules/audio_processing/aec3/erle_estimator.cc \
./webrtc_dsp/modules/audio_processing/aec3/reverb_model.cc \
./webrtc_dsp/modules/audio_processing/aec3/cascaded_biquad_filter.cc \
./webrtc_dsp/modules/audio_processing/aec3/render_buffer.cc \
./webrtc_dsp/modules/audio_processing/aec3/subtractor_output.cc \
./webrtc_dsp/modules/audio_processing/aec3/stationarity_estimator.cc \
./webrtc_dsp/modules/audio_processing/aec3/render_signal_analyzer.cc \
./webrtc_dsp/modules/audio_processing/aec3/subtractor_output_analyzer.cc \
./webrtc_dsp/modules/audio_processing/aec3/suppression_gain.cc \
./webrtc_dsp/modules/audio_processing/aec3/echo_audibility.cc \
./webrtc_dsp/modules/audio_processing/aec3/block_processor_metrics.cc \
./webrtc_dsp/modules/audio_processing/aec3/moving_average.cc \
./webrtc_dsp/modules/audio_processing/aec3/reverb_model_estimator.cc \
./webrtc_dsp/modules/audio_processing/aec3/aec3_common.cc \
./webrtc_dsp/modules/audio_processing/aec3/residual_echo_estimator.cc \
./webrtc_dsp/modules/audio_processing/aec3/matched_filter.cc \
./webrtc_dsp/modules/audio_processing/aec3/reverb_decay_estimator.cc \
./webrtc_dsp/modules/audio_processing/aec3/render_delay_controller2.cc \
./webrtc_dsp/modules/audio_processing/aec3/suppression_gain_limiter.cc \
./webrtc_dsp/modules/audio_processing/aec3/main_filter_update_gain.cc \
./webrtc_dsp/modules/audio_processing/aec3/echo_remover.cc \
./webrtc_dsp/modules/audio_processing/aec3/downsampled_render_buffer.cc \
./webrtc_dsp/modules/audio_processing/aec3/matrix_buffer.cc \
./webrtc_dsp/modules/audio_processing/aec3/block_processor2.cc \
./webrtc_dsp/modules/audio_processing/aec3/echo_canceller3.cc \
./webrtc_dsp/modules/audio_processing/aec3/block_delay_buffer.cc \
./webrtc_dsp/modules/audio_processing/aec3/fft_buffer.cc \
./webrtc_dsp/modules/audio_processing/aec3/comfort_noise_generator.cc \
./webrtc_dsp/modules/audio_processing/aec3/shadow_filter_update_gain.cc \
./webrtc_dsp/modules/audio_processing/aec3/filter_analyzer.cc \
./webrtc_dsp/modules/audio_processing/aec3/reverb_frequency_response.cc \
./webrtc_dsp/modules/audio_processing/aec3/decimator.cc \
./webrtc_dsp/modules/audio_processing/echo_control_mobile_impl.cc \
./webrtc_dsp/modules/audio_processing/logging/apm_data_dumper.cc \
./webrtc_dsp/modules/audio_processing/vad/voice_activity_detector.cc \
./webrtc_dsp/modules/audio_processing/vad/standalone_vad.cc \
./webrtc_dsp/modules/audio_processing/vad/pitch_internal.cc \
./webrtc_dsp/modules/audio_processing/vad/vad_circular_buffer.cc \
./webrtc_dsp/modules/audio_processing/vad/vad_audio_proc.cc \
./webrtc_dsp/modules/audio_processing/vad/pole_zero_filter.cc \
./webrtc_dsp/modules/audio_processing/vad/pitch_based_vad.cc \
./webrtc_dsp/modules/audio_processing/vad/gmm.cc \
./webrtc_dsp/modules/audio_processing/utility/ooura_fft.cc \
./webrtc_dsp/modules/audio_processing/utility/delay_estimator_wrapper.cc \
./webrtc_dsp/modules/audio_processing/utility/delay_estimator.cc \
./webrtc_dsp/modules/audio_processing/utility/block_mean_calculator.cc \
./webrtc_dsp/common_audio/window_generator.cc \
./webrtc_dsp/common_audio/channel_buffer.cc \
./webrtc_dsp/common_audio/fir_filter_factory.cc \
./webrtc_dsp/common_audio/wav_header.cc \
./webrtc_dsp/common_audio/real_fourier_ooura.cc \
./webrtc_dsp/common_audio/audio_util.cc \
./webrtc_dsp/common_audio/fir_filter_sse.cc \
./webrtc_dsp/common_audio/resampler/push_sinc_resampler.cc \
./webrtc_dsp/common_audio/resampler/resampler.cc \
./webrtc_dsp/common_audio/resampler/sinc_resampler_sse.cc \
./webrtc_dsp/common_audio/resampler/push_resampler.cc \
./webrtc_dsp/common_audio/resampler/sinc_resampler.cc \
./webrtc_dsp/common_audio/resampler/sinusoidal_linear_chirp_source.cc \
./webrtc_dsp/common_audio/wav_file.cc \
./webrtc_dsp/common_audio/third_party/fft4g/fft4g.c \
./webrtc_dsp/common_audio/audio_converter.cc \
./webrtc_dsp/common_audio/real_fourier.cc \
./webrtc_dsp/common_audio/sparse_fir_filter.cc \
./webrtc_dsp/common_audio/smoothing_filter.cc \
./webrtc_dsp/common_audio/fir_filter_c.cc \
./webrtc_dsp/common_audio/ring_buffer.c \
./webrtc_dsp/common_audio/signal_processing/complex_fft.c \
./webrtc_dsp/common_audio/signal_processing/filter_ma_fast_q12.c \
./webrtc_dsp/common_audio/signal_processing/splitting_filter1.c \
./webrtc_dsp/common_audio/signal_processing/levinson_durbin.c \
./webrtc_dsp/common_audio/signal_processing/dot_product_with_scale.cc \
./webrtc_dsp/common_audio/signal_processing/auto_corr_to_refl_coef.c \
./webrtc_dsp/common_audio/signal_processing/resample_by_2_internal.c \
./webrtc_dsp/common_audio/signal_processing/energy.c \
./webrtc_dsp/common_audio/signal_processing/sqrt_of_one_minus_x_squared.c \
./webrtc_dsp/common_audio/signal_processing/downsample_fast.c \
./webrtc_dsp/common_audio/signal_processing/filter_ar_fast_q12.c \
./webrtc_dsp/common_audio/signal_processing/spl_init.c \
./webrtc_dsp/common_audio/signal_processing/lpc_to_refl_coef.c \
./webrtc_dsp/common_audio/signal_processing/cross_correlation.c \
./webrtc_dsp/common_audio/signal_processing/division_operations.c \
./webrtc_dsp/common_audio/signal_processing/auto_correlation.c \
./webrtc_dsp/common_audio/signal_processing/get_scaling_square.c \
./webrtc_dsp/common_audio/signal_processing/resample.c \
./webrtc_dsp/common_audio/signal_processing/min_max_operations.c \
./webrtc_dsp/common_audio/signal_processing/refl_coef_to_lpc.c \
./webrtc_dsp/common_audio/signal_processing/filter_ar.c \
./webrtc_dsp/common_audio/signal_processing/vector_scaling_operations.c \
./webrtc_dsp/common_audio/signal_processing/resample_fractional.c \
./webrtc_dsp/common_audio/signal_processing/real_fft.c \
./webrtc_dsp/common_audio/signal_processing/ilbc_specific_functions.c \
./webrtc_dsp/common_audio/signal_processing/randomization_functions.c \
./webrtc_dsp/common_audio/signal_processing/copy_set_operations.c \
./webrtc_dsp/common_audio/signal_processing/resample_by_2.c \
./webrtc_dsp/common_audio/signal_processing/get_hanning_window.c \
./webrtc_dsp/common_audio/signal_processing/resample_48khz.c \
./webrtc_dsp/common_audio/signal_processing/spl_inl.c \
./webrtc_dsp/common_audio/signal_processing/spl_sqrt.c \
./webrtc_dsp/common_audio/vad/vad_sp.c \
./webrtc_dsp/common_audio/vad/vad.cc \
./webrtc_dsp/common_audio/vad/webrtc_vad.c \
./webrtc_dsp/common_audio/vad/vad_filterbank.c \
./webrtc_dsp/common_audio/vad/vad_core.c \
./webrtc_dsp/common_audio/vad/vad_gmm.c

if TARGET_OS_OSX
CFLAGS += -DWEBRTC_MAC
SRC += \
webrtc_dsp/rtc_base/logging_mac.mm \
webrtc_dsp/rtc_base/logging_mac.h
else
CFLAGS += -DWEBRTC_LINUX
endif

if TARGET_CPU_X86
SRC += \
webrtc_dsp/modules/audio_processing/aec/aec_core_sse2.cc \
webrtc_dsp/modules/audio_processing/utility/ooura_fft_sse2.cc
endif

if ENABLE_AUDIO_CALLBACK
CFLAGS += -DTGVOIP_USE_CALLBACK_AUDIO_IO
SRC += \
audio/AudioIOCallback.cpp
TGVOIP_HDRS += \
audio/AudioIOCallback.h
endif

if TARGET_CPU_ARM
SRC += \
webrtc_dsp/common_audio/signal_processing/complex_bit_reverse_arm.S \
webrtc_dsp/common_audio/third_party/spl_sqrt_floor/spl_sqrt_floor_arm.S
if TARGET_CPU_ARMV7
CFLAGS += -mfpu=neon -mfloat-abi=hard
CCASFLAGS += -mfpu=neon -mfloat-abi=hard
SRC += \
webrtc_dsp/common_audio/signal_processing/cross_correlation_neon.c \
webrtc_dsp/common_audio/signal_processing/downsample_fast_neon.c \
webrtc_dsp/common_audio/signal_processing/min_max_operations_neon.c \
webrtc_dsp/modules/audio_processing/aec/aec_core_neon.cc \
webrtc_dsp/modules/audio_processing/aecm/aecm_core_neon.cc \
webrtc_dsp/modules/audio_processing/ns/nsx_core_neon.c \
webrtc_dsp/modules/audio_processing/utility/ooura_fft_neon.cc
# webrtc_dsp/common_audio/signal_processing/filter_ar_fast_q12_armv7.S
endif
else
SRC += \
webrtc_dsp/common_audio/signal_processing/complex_bit_reverse.c \
webrtc_dsp/common_audio/third_party/spl_sqrt_floor/spl_sqrt_floor.c
endif

# headers
SRC += \
webrtc_dsp/system_wrappers/include/field_trial.h \
webrtc_dsp/system_wrappers/include/cpu_features_wrapper.h \
webrtc_dsp/system_wrappers/include/asm_defines.h \
webrtc_dsp/system_wrappers/include/metrics.h \
webrtc_dsp/system_wrappers/include/compile_assert_c.h \
webrtc_dsp/typedefs.h \
webrtc_dsp/absl/strings/internal/memutil.h \
webrtc_dsp/absl/strings/ascii.h \
webrtc_dsp/absl/strings/string_view.h \
webrtc_dsp/absl/types/optional.h \
webrtc_dsp/absl/types/bad_optional_access.h \
webrtc_dsp/absl/memory/memory.h \
webrtc_dsp/absl/meta/type_traits.h \
webrtc_dsp/absl/algorithm/algorithm.h \
webrtc_dsp/absl/container/inlined_vector.h \
webrtc_dsp/absl/base/policy_checks.h \
webrtc_dsp/absl/base/port.h \
webrtc_dsp/absl/base/config.h \
webrtc_dsp/absl/base/internal/invoke.h \
webrtc_dsp/absl/base/internal/inline_variable.h \
webrtc_dsp/absl/base/internal/atomic_hook.h \
webrtc_dsp/absl/base/internal/identity.h \
webrtc_dsp/absl/base/internal/raw_logging.h \
webrtc_dsp/absl/base/internal/throw_delegate.h \
webrtc_dsp/absl/base/attributes.h \
webrtc_dsp/absl/base/macros.h \
webrtc_dsp/absl/base/optimization.h \
webrtc_dsp/absl/base/log_severity.h \
webrtc_dsp/absl/utility/utility.h \
webrtc_dsp/rtc_base/string_to_number.h \
webrtc_dsp/rtc_base/constructormagic.h \
webrtc_dsp/rtc_base/strings/string_builder.h \
webrtc_dsp/rtc_base/event_tracer.h \
webrtc_dsp/rtc_base/stringencode.h \
webrtc_dsp/rtc_base/memory/aligned_malloc.h \
webrtc_dsp/rtc_base/event.h \
webrtc_dsp/rtc_base/ignore_wundef.h \
webrtc_dsp/rtc_base/stringutils.h \
webrtc_dsp/rtc_base/arraysize.h \
webrtc_dsp/rtc_base/swap_queue.h \
webrtc_dsp/rtc_base/trace_event.h \
webrtc_dsp/rtc_base/checks.h \
webrtc_dsp/rtc_base/deprecation.h \
webrtc_dsp/rtc_base/sanitizer.h \
webrtc_dsp/rtc_base/scoped_ref_ptr.h \
webrtc_dsp/rtc_base/logging.h \
webrtc_dsp/rtc_base/timeutils.h \
webrtc_dsp/rtc_base/atomicops.h \
webrtc_dsp/rtc_base/numerics/safe_minmax.h \
webrtc_dsp/rtc_base/numerics/safe_conversions.h \
webrtc_dsp/rtc_base/numerics/safe_conversions_impl.h \
webrtc_dsp/rtc_base/numerics/safe_compare.h \
webrtc_dsp/rtc_base/system/unused.h \
webrtc_dsp/rtc_base/system/inline.h \
webrtc_dsp/rtc_base/system/ignore_warnings.h \
webrtc_dsp/rtc_base/system/asm_defines.h \
webrtc_dsp/rtc_base/system/rtc_export.h \
webrtc_dsp/rtc_base/system/arch.h \
webrtc_dsp/rtc_base/platform_thread.h \
webrtc_dsp/rtc_base/platform_thread_types.h \
webrtc_dsp/rtc_base/protobuf_utils.h \
webrtc_dsp/rtc_base/thread_annotations.h \
webrtc_dsp/rtc_base/gtest_prod_util.h \
webrtc_dsp/rtc_base/function_view.h \
webrtc_dsp/rtc_base/criticalsection.h \
webrtc_dsp/rtc_base/refcount.h \
webrtc_dsp/rtc_base/thread_checker_impl.h \
webrtc_dsp/rtc_base/compile_assert_c.h \
webrtc_dsp/rtc_base/type_traits.h \
webrtc_dsp/rtc_base/platform_file.h \
webrtc_dsp/rtc_base/refcounter.h \
webrtc_dsp/rtc_base/thread_checker.h \
webrtc_dsp/rtc_base/race_checker.h \
webrtc_dsp/rtc_base/refcountedobject.h \
webrtc_dsp/third_party/rnnoise/src/rnn_activations.h \
webrtc_dsp/third_party/rnnoise/src/kiss_fft.h \
webrtc_dsp/third_party/rnnoise/src/rnn_vad_weights.h \
webrtc_dsp/api/audio/echo_canceller3_config.h \
webrtc_dsp/api/audio/echo_control.h \
webrtc_dsp/api/audio/audio_frame.h \
webrtc_dsp/api/audio/echo_canceller3_factory.h \
webrtc_dsp/api/array_view.h \
webrtc_dsp/modules/third_party/fft/fft.h \
webrtc_dsp/modules/audio_coding/codecs/isac/bandwidth_info.h \
webrtc_dsp/modules/audio_coding/codecs/isac/main/include/isac.h \
webrtc_dsp/modules/audio_coding/codecs/isac/main/source/os_specific_inline.h \
webrtc_dsp/modules/audio_coding/codecs/isac/main/source/entropy_coding.h \
webrtc_dsp/modules/audio_coding/codecs/isac/main/source/isac_vad.h \
webrtc_dsp/modules/audio_coding/codecs/isac/main/source/settings.h \
webrtc_dsp/modules/audio_coding/codecs/isac/main/source/lpc_shape_swb12_tables.h \
webrtc_dsp/modules/audio_coding/codecs/isac/main/source/arith_routines.h \
webrtc_dsp/modules/audio_coding/codecs/isac/main/source/crc.h \
webrtc_dsp/modules/audio_coding/codecs/isac/main/source/isac_float_type.h \
webrtc_dsp/modules/audio_coding/codecs/isac/main/source/pitch_lag_tables.h \
webrtc_dsp/modules/audio_coding/codecs/isac/main/source/spectrum_ar_model_tables.h \
webrtc_dsp/modules/audio_coding/codecs/isac/main/source/codec.h \
webrtc_dsp/modules/audio_coding/codecs/isac/main/source/pitch_gain_tables.h \
webrtc_dsp/modules/audio_coding/codecs/isac/main/source/lpc_shape_swb16_tables.h \
webrtc_dsp/modules/audio_coding/codecs/isac/main/source/pitch_estimator.h \
webrtc_dsp/modules/audio_coding/codecs/isac/main/source/structs.h \
webrtc_dsp/modules/audio_coding/codecs/isac/main/source/filter_functions.h \
webrtc_dsp/modules/audio_coding/codecs/isac/main/source/encode_lpc_swb.h \
webrtc_dsp/modules/audio_coding/codecs/isac/main/source/pitch_filter.h \
webrtc_dsp/modules/audio_coding/codecs/isac/main/source/lpc_analysis.h \
webrtc_dsp/modules/audio_coding/codecs/isac/main/source/bandwidth_estimator.h \
webrtc_dsp/modules/audio_coding/codecs/isac/main/source/lpc_gain_swb_tables.h \
webrtc_dsp/modules/audio_coding/codecs/isac/main/source/lpc_tables.h \
webrtc_dsp/modules/audio_processing/echo_detector/moving_max.h \
webrtc_dsp/modules/audio_processing/echo_detector/circular_buffer.h \
webrtc_dsp/modules/audio_processing/echo_detector/normalized_covariance_estimator.h \
webrtc_dsp/modules/audio_processing/echo_detector/mean_variance_estimator.h \
webrtc_dsp/modules/audio_processing/gain_control_for_experimental_agc.h \
webrtc_dsp/modules/audio_processing/rms_level.h \
webrtc_dsp/modules/audio_processing/ns/ns_core.h \
webrtc_dsp/modules/audio_processing/ns/defines.h \
webrtc_dsp/modules/audio_processing/ns/noise_suppression.h \
webrtc_dsp/modules/audio_processing/ns/nsx_core.h \
webrtc_dsp/modules/audio_processing/ns/windows_private.h \
webrtc_dsp/modules/audio_processing/ns/noise_suppression_x.h \
webrtc_dsp/modules/audio_processing/ns/nsx_defines.h \
webrtc_dsp/modules/audio_processing/residual_echo_detector.h \
webrtc_dsp/modules/audio_processing/audio_processing_impl.h \
webrtc_dsp/modules/audio_processing/render_queue_item_verifier.h \
webrtc_dsp/modules/audio_processing/include/audio_generator.h \
webrtc_dsp/modules/audio_processing/include/config.h \
webrtc_dsp/modules/audio_processing/include/audio_frame_view.h \
webrtc_dsp/modules/audio_processing/include/mock_audio_processing.h \
webrtc_dsp/modules/audio_processing/include/gain_control.h \
webrtc_dsp/modules/audio_processing/include/audio_generator_factory.h \
webrtc_dsp/modules/audio_processing/include/aec_dump.h \
webrtc_dsp/modules/audio_processing/include/audio_processing_statistics.h \
webrtc_dsp/modules/audio_processing/include/audio_processing.h \
webrtc_dsp/modules/audio_processing/agc2/interpolated_gain_curve.h \
webrtc_dsp/modules/audio_processing/agc2/biquad_filter.h \
webrtc_dsp/modules/audio_processing/agc2/agc2_testing_common.h \
webrtc_dsp/modules/audio_processing/agc2/adaptive_mode_level_estimator.h \
webrtc_dsp/modules/audio_processing/agc2/signal_classifier.h \
webrtc_dsp/modules/audio_processing/agc2/vector_float_frame.h \
webrtc_dsp/modules/audio_processing/agc2/rnn_vad/sequence_buffer.h \
webrtc_dsp/modules/audio_processing/agc2/rnn_vad/rnn.h \
webrtc_dsp/modules/audio_processing/agc2/rnn_vad/test_utils.h \
webrtc_dsp/modules/audio_processing/agc2/rnn_vad/pitch_info.h \
webrtc_dsp/modules/audio_processing/agc2/rnn_vad/lp_residual.h \
webrtc_dsp/modules/audio_processing/agc2/rnn_vad/ring_buffer.h \
webrtc_dsp/modules/audio_processing/agc2/rnn_vad/symmetric_matrix_buffer.h \
webrtc_dsp/modules/audio_processing/agc2/rnn_vad/spectral_features.h \
webrtc_dsp/modules/audio_processing/agc2/rnn_vad/features_extraction.h \
webrtc_dsp/modules/audio_processing/agc2/rnn_vad/common.h \
webrtc_dsp/modules/audio_processing/agc2/rnn_vad/spectral_features_internal.h \
webrtc_dsp/modules/audio_processing/agc2/rnn_vad/fft_util.h \
webrtc_dsp/modules/audio_processing/agc2/rnn_vad/pitch_search_internal.h \
webrtc_dsp/modules/audio_processing/agc2/rnn_vad/pitch_search.h \
webrtc_dsp/modules/audio_processing/agc2/fixed_gain_controller.h \
webrtc_dsp/modules/audio_processing/agc2/down_sampler.h \
webrtc_dsp/modules/audio_processing/agc2/saturation_protector.h \
webrtc_dsp/modules/audio_processing/agc2/agc2_common.h \
webrtc_dsp/modules/audio_processing/agc2/adaptive_mode_level_estimator_agc.h \
webrtc_dsp/modules/audio_processing/agc2/adaptive_digital_gain_applier.h \
webrtc_dsp/modules/audio_processing/agc2/vad_with_level.h \
webrtc_dsp/modules/audio_processing/agc2/limiter_db_gain_curve.h \
webrtc_dsp/modules/audio_processing/agc2/fixed_digital_level_estimator.h \
webrtc_dsp/modules/audio_processing/agc2/adaptive_agc.h \
webrtc_dsp/modules/audio_processing/agc2/gain_applier.h \
webrtc_dsp/modules/audio_processing/agc2/noise_level_estimator.h \
webrtc_dsp/modules/audio_processing/agc2/compute_interpolated_gain_curve.h \
webrtc_dsp/modules/audio_processing/agc2/noise_spectrum_estimator.h \
webrtc_dsp/modules/audio_processing/agc2/limiter.h \
webrtc_dsp/modules/audio_processing/transient/transient_detector.h \
webrtc_dsp/modules/audio_processing/transient/transient_suppressor.h \
webrtc_dsp/modules/audio_processing/transient/daubechies_8_wavelet_coeffs.h \
webrtc_dsp/modules/audio_processing/transient/common.h \
webrtc_dsp/modules/audio_processing/transient/wpd_node.h \
webrtc_dsp/modules/audio_processing/transient/moving_moments.h \
webrtc_dsp/modules/audio_processing/transient/wpd_tree.h \
webrtc_dsp/modules/audio_processing/transient/dyadic_decimator.h \
webrtc_dsp/modules/audio_processing/noise_suppression_impl.h \
webrtc_dsp/modules/audio_processing/aec/aec_resampler.h \
webrtc_dsp/modules/audio_processing/aec/echo_cancellation.h \
webrtc_dsp/modules/audio_processing/aec/aec_core.h \
webrtc_dsp/modules/audio_processing/aec/aec_core_optimized_methods.h \
webrtc_dsp/modules/audio_processing/aec/aec_common.h \
webrtc_dsp/modules/audio_processing/voice_detection_impl.h \
webrtc_dsp/modules/audio_processing/agc/legacy/analog_agc.h \
webrtc_dsp/modules/audio_processing/agc/legacy/gain_control.h \
webrtc_dsp/modules/audio_processing/agc/legacy/digital_agc.h \
webrtc_dsp/modules/audio_processing/agc/mock_agc.h \
webrtc_dsp/modules/audio_processing/agc/loudness_histogram.h \
webrtc_dsp/modules/audio_processing/agc/gain_map_internal.h \
webrtc_dsp/modules/audio_processing/agc/utility.h \
webrtc_dsp/modules/audio_processing/agc/agc_manager_direct.h \
webrtc_dsp/modules/audio_processing/agc/agc.h \
webrtc_dsp/modules/audio_processing/common.h \
webrtc_dsp/modules/audio_processing/audio_buffer.h \
webrtc_dsp/modules/audio_processing/echo_control_mobile_impl.h \
webrtc_dsp/modules/audio_processing/splitting_filter.h \
webrtc_dsp/modules/audio_processing/low_cut_filter.h \
webrtc_dsp/modules/audio_processing/audio_generator/file_audio_generator.h \
webrtc_dsp/modules/audio_processing/three_band_filter_bank.h \
webrtc_dsp/modules/audio_processing/echo_cancellation_impl.h \
webrtc_dsp/modules/audio_processing/level_estimator_impl.h \
webrtc_dsp/modules/audio_processing/gain_controller2.h \
webrtc_dsp/modules/audio_processing/aecm/aecm_core.h \
webrtc_dsp/modules/audio_processing/aecm/aecm_defines.h \
webrtc_dsp/modules/audio_processing/aecm/echo_control_mobile.h \
webrtc_dsp/modules/audio_processing/aec3/downsampled_render_buffer.h \
webrtc_dsp/modules/audio_processing/aec3/subtractor_output_analyzer.h \
webrtc_dsp/modules/audio_processing/aec3/residual_echo_estimator.h \
webrtc_dsp/modules/audio_processing/aec3/shadow_filter_update_gain.h \
webrtc_dsp/modules/audio_processing/aec3/aec_state.h \
webrtc_dsp/modules/audio_processing/aec3/suppression_filter.h \
webrtc_dsp/modules/audio_processing/aec3/block_delay_buffer.h \
webrtc_dsp/modules/audio_processing/aec3/adaptive_fir_filter.h \
webrtc_dsp/modules/audio_processing/aec3/cascaded_biquad_filter.h \
webrtc_dsp/modules/audio_processing/aec3/matched_filter.h \
webrtc_dsp/modules/audio_processing/aec3/subtractor_output.h \
webrtc_dsp/modules/audio_processing/aec3/render_signal_analyzer.h \
webrtc_dsp/modules/audio_processing/aec3/aec3_fft.h \
webrtc_dsp/modules/audio_processing/aec3/echo_remover_metrics.h \
webrtc_dsp/modules/audio_processing/aec3/filter_analyzer.h \
webrtc_dsp/modules/audio_processing/aec3/subtractor.h \
webrtc_dsp/modules/audio_processing/aec3/echo_path_delay_estimator.h \
webrtc_dsp/modules/audio_processing/aec3/block_processor_metrics.h \
webrtc_dsp/modules/audio_processing/aec3/fft_data.h \
webrtc_dsp/modules/audio_processing/aec3/render_delay_controller_metrics.h \
webrtc_dsp/modules/audio_processing/aec3/comfort_noise_generator.h \
webrtc_dsp/modules/audio_processing/aec3/erl_estimator.h \
webrtc_dsp/modules/audio_processing/aec3/echo_remover.h \
webrtc_dsp/modules/audio_processing/aec3/matrix_buffer.h \
webrtc_dsp/modules/audio_processing/aec3/reverb_model_estimator.h \
webrtc_dsp/modules/audio_processing/aec3/echo_path_variability.h \
webrtc_dsp/modules/audio_processing/aec3/moving_average.h \
webrtc_dsp/modules/audio_processing/aec3/render_reverb_model.h \
webrtc_dsp/modules/audio_processing/aec3/render_delay_controller.h \
webrtc_dsp/modules/audio_processing/aec3/suppression_gain.h \
webrtc_dsp/modules/audio_processing/aec3/erle_estimator.h \
webrtc_dsp/modules/audio_processing/aec3/subband_erle_estimator.h \
webrtc_dsp/modules/audio_processing/aec3/block_processor.h \
webrtc_dsp/modules/audio_processing/aec3/fullband_erle_estimator.h \
webrtc_dsp/modules/audio_processing/aec3/stationarity_estimator.h \
webrtc_dsp/modules/audio_processing/aec3/echo_canceller3.h \
webrtc_dsp/modules/audio_processing/aec3/skew_estimator.h \
webrtc_dsp/modules/audio_processing/aec3/render_buffer.h \
webrtc_dsp/modules/audio_processing/aec3/reverb_model_fallback.h \
webrtc_dsp/modules/audio_processing/aec3/vector_buffer.h \
webrtc_dsp/modules/audio_processing/aec3/reverb_frequency_response.h \
webrtc_dsp/modules/audio_processing/aec3/echo_audibility.h \
webrtc_dsp/modules/audio_processing/aec3/fft_buffer.h \
webrtc_dsp/modules/audio_processing/aec3/aec3_common.h \
webrtc_dsp/modules/audio_processing/aec3/vector_math.h \
webrtc_dsp/modules/audio_processing/aec3/decimator.h \
webrtc_dsp/modules/audio_processing/aec3/frame_blocker.h \
webrtc_dsp/modules/audio_processing/aec3/block_framer.h \
webrtc_dsp/modules/audio_processing/aec3/suppression_gain_limiter.h \
webrtc_dsp/modules/audio_processing/aec3/delay_estimate.h \
webrtc_dsp/modules/audio_processing/aec3/reverb_model.h \
webrtc_dsp/modules/audio_processing/aec3/main_filter_update_gain.h \
webrtc_dsp/modules/audio_processing/aec3/matched_filter_lag_aggregator.h \
webrtc_dsp/modules/audio_processing/aec3/reverb_decay_estimator.h \
webrtc_dsp/modules/audio_processing/aec3/render_delay_buffer.h \
webrtc_dsp/modules/audio_processing/gain_control_impl.h \
webrtc_dsp/modules/audio_processing/typing_detection.h \
webrtc_dsp/modules/audio_processing/logging/apm_data_dumper.h \
webrtc_dsp/modules/audio_processing/vad/vad_audio_proc_internal.h \
webrtc_dsp/modules/audio_processing/vad/vad_circular_buffer.h \
webrtc_dsp/modules/audio_processing/vad/pitch_based_vad.h \
webrtc_dsp/modules/audio_processing/vad/pole_zero_filter.h \
webrtc_dsp/modules/audio_processing/vad/gmm.h \
webrtc_dsp/modules/audio_processing/vad/common.h \
webrtc_dsp/modules/audio_processing/vad/vad_audio_proc.h \
webrtc_dsp/modules/audio_processing/vad/voice_gmm_tables.h \
webrtc_dsp/modules/audio_processing/vad/noise_gmm_tables.h \
webrtc_dsp/modules/audio_processing/vad/pitch_internal.h \
webrtc_dsp/modules/audio_processing/vad/standalone_vad.h \
webrtc_dsp/modules/audio_processing/vad/voice_activity_detector.h \
webrtc_dsp/modules/audio_processing/utility/ooura_fft_tables_neon_sse2.h \
webrtc_dsp/modules/audio_processing/utility/delay_estimator_internal.h \
webrtc_dsp/modules/audio_processing/utility/ooura_fft.h \
webrtc_dsp/modules/audio_processing/utility/block_mean_calculator.h \
webrtc_dsp/modules/audio_processing/utility/delay_estimator.h \
webrtc_dsp/modules/audio_processing/utility/ooura_fft_tables_common.h \
webrtc_dsp/modules/audio_processing/utility/delay_estimator_wrapper.h \
webrtc_dsp/common_audio/mocks/mock_smoothing_filter.h \
webrtc_dsp/common_audio/wav_file.h \
webrtc_dsp/common_audio/sparse_fir_filter.h \
webrtc_dsp/common_audio/fir_filter_sse.h \
webrtc_dsp/common_audio/window_generator.h \
webrtc_dsp/common_audio/ring_buffer.h \
webrtc_dsp/common_audio/fir_filter.h \
webrtc_dsp/common_audio/include/audio_util.h \
webrtc_dsp/common_audio/real_fourier_ooura.h \
webrtc_dsp/common_audio/smoothing_filter.h \
webrtc_dsp/common_audio/resampler/sinc_resampler.h \
webrtc_dsp/common_audio/resampler/include/push_resampler.h \
webrtc_dsp/common_audio/resampler/include/resampler.h \
webrtc_dsp/common_audio/resampler/push_sinc_resampler.h \
webrtc_dsp/common_audio/resampler/sinusoidal_linear_chirp_source.h \
webrtc_dsp/common_audio/fir_filter_factory.h \
webrtc_dsp/common_audio/audio_converter.h \
webrtc_dsp/common_audio/third_party/spl_sqrt_floor/spl_sqrt_floor.h \
webrtc_dsp/common_audio/third_party/fft4g/fft4g.h \
webrtc_dsp/common_audio/channel_buffer.h \
webrtc_dsp/common_audio/real_fourier.h \
webrtc_dsp/common_audio/fir_filter_neon.h \
webrtc_dsp/common_audio/fir_filter_c.h \
webrtc_dsp/common_audio/signal_processing/complex_fft_tables.h \
webrtc_dsp/common_audio/signal_processing/include/signal_processing_library.h \
webrtc_dsp/common_audio/signal_processing/include/real_fft.h \
webrtc_dsp/common_audio/signal_processing/include/spl_inl.h \
webrtc_dsp/common_audio/signal_processing/include/spl_inl_armv7.h \
webrtc_dsp/common_audio/signal_processing/dot_product_with_scale.h \
webrtc_dsp/common_audio/signal_processing/resample_by_2_internal.h \
webrtc_dsp/common_audio/wav_header.h \
webrtc_dsp/common_audio/vad/vad_core.h \
webrtc_dsp/common_audio/vad/include/vad.h \
webrtc_dsp/common_audio/vad/include/webrtc_vad.h \
webrtc_dsp/common_audio/vad/vad_gmm.h \
webrtc_dsp/common_audio/vad/vad_sp.h \
webrtc_dsp/common_audio/vad/vad_filterbank.h

else
CFLAGS += -DTGVOIP_NO_DSP
endif

libtgvoip_la_SOURCES = $(SRC) $(TGVOIP_HDRS)
tgvoipincludedir = $(includedir)/tgvoip
nobase_tgvoipinclude_HEADERS = $(TGVOIP_HDRS)

CXXFLAGS += -std=gnu++0x $(CFLAGS)
if TARGET_OS_OSX
OBJCFLAGS = $(CFLAGS)
OBJCXXFLAGS += -std=gnu++0x $(CFLAGS)
endif