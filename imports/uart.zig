const sys = @import("sys");
const std = @import("std");
const errors = @import("error");

pub extern fn uart_driver_install(uart_num: sys.uart_port_t, rx_buffer_size: c_int, tx_buffer_size: c_int, queue_size: c_int, uart_queue: [*c]sys.QueueHandle_t, intr_alloc_flags: c_int) sys.esp_err_t;
pub extern fn uart_driver_delete(uart_num: sys.uart_port_t) sys.esp_err_t;
pub extern fn uart_is_driver_installed(uart_num: sys.uart_port_t) bool;
pub extern fn uart_set_word_length(uart_num: sys.uart_port_t, data_bit: sys.uart_word_length_t) sys.esp_err_t;
pub extern fn uart_get_word_length(uart_num: sys.uart_port_t, data_bit: [*c]sys.uart_word_length_t) sys.esp_err_t;
pub extern fn uart_set_stop_bits(uart_num: sys.uart_port_t, stop_bits: sys.uart_stop_bits_t) sys.esp_err_t;
pub extern fn uart_get_stop_bits(uart_num: sys.uart_port_t, stop_bits: [*c]sys.uart_stop_bits_t) sys.esp_err_t;
pub extern fn uart_set_parity(uart_num: sys.uart_port_t, parity_mode: sys.uart_parity_t) sys.esp_err_t;
pub extern fn uart_get_parity(uart_num: sys.uart_port_t, parity_mode: [*c]sys.uart_parity_t) sys.esp_err_t;
pub extern fn uart_get_sclk_freq(sclk: sys.uart_sclk_t, out_freq_hz: [*c]u32) sys.esp_err_t;
pub extern fn uart_set_baudrate(uart_num: sys.uart_port_t, baudrate: u32) sys.esp_err_t;
pub extern fn uart_get_baudrate(uart_num: sys.uart_port_t, baudrate: [*c]u32) sys.esp_err_t;
pub extern fn uart_set_line_inverse(uart_num: sys.uart_port_t, inverse_mask: u32) sys.esp_err_t;
pub extern fn uart_set_hw_flow_ctrl(uart_num: sys.uart_port_t, flow_ctrl: sys.uart_hw_flowcontrol_t, rx_thresh: u8) sys.esp_err_t;
pub extern fn uart_set_sw_flow_ctrl(uart_num: sys.uart_port_t, enable: bool, rx_thresh_xon: u8, rx_thresh_xoff: u8) sys.esp_err_t;
pub extern fn uart_get_hw_flow_ctrl(uart_num: sys.uart_port_t, flow_ctrl: [*c]sys.uart_hw_flowcontrol_t) sys.esp_err_t;
pub extern fn uart_clear_intr_status(uart_num: sys.uart_port_t, clr_mask: u32) sys.esp_err_t;
pub extern fn uart_enable_intr_mask(uart_num: sys.uart_port_t, enable_mask: u32) sys.esp_err_t;
pub extern fn uart_disable_intr_mask(uart_num: sys.uart_port_t, disable_mask: u32) sys.esp_err_t;
pub extern fn uart_enable_rx_intr(uart_num: sys.uart_port_t) sys.esp_err_t;
pub extern fn uart_disable_rx_intr(uart_num: sys.uart_port_t) sys.esp_err_t;
pub extern fn uart_disable_tx_intr(uart_num: sys.uart_port_t) sys.esp_err_t;
pub extern fn uart_enable_tx_intr(uart_num: sys.uart_port_t, enable: c_int, thresh: c_int) sys.esp_err_t;
pub extern fn uart_set_pin(uart_num: sys.uart_port_t, tx_io_num: c_int, rx_io_num: c_int, rts_io_num: c_int, cts_io_num: c_int) sys.esp_err_t;
pub extern fn uart_set_rts(uart_num: sys.uart_port_t, level: c_int) sys.esp_err_t;
pub extern fn uart_set_dtr(uart_num: sys.uart_port_t, level: c_int) sys.esp_err_t;
pub extern fn uart_set_tx_idle_num(uart_num: sys.uart_port_t, idle_num: u16) sys.esp_err_t;
pub extern fn uart_param_config(uart_num: sys.uart_port_t, uart_config: [*c]const sys.uart_config_t) sys.esp_err_t;
pub extern fn uart_intr_config(uart_num: sys.uart_port_t, intr_conf: [*c]const sys.uart_intr_config_t) sys.esp_err_t;
pub extern fn uart_wait_tx_done(uart_num: sys.uart_port_t, ticks_to_wait: sys.TickType_t) sys.esp_err_t;
pub extern fn uart_tx_chars(uart_num: sys.uart_port_t, buffer: [*c]const u8, len: u32) c_int;
pub extern fn uart_write_bytes(uart_num: sys.uart_port_t, src: ?*const anyopaque, size: usize) c_int;
pub extern fn uart_write_bytes_with_break(uart_num: sys.uart_port_t, src: ?*const anyopaque, size: usize, brk_len: c_int) c_int;
pub extern fn uart_read_bytes(uart_num: sys.uart_port_t, buf: ?*anyopaque, length: u32, ticks_to_wait: sys.TickType_t) c_int;
pub extern fn uart_flush(uart_num: sys.uart_port_t) sys.esp_err_t;
pub extern fn uart_flush_input(uart_num: sys.uart_port_t) sys.esp_err_t;
pub extern fn uart_get_buffered_data_len(uart_num: sys.uart_port_t, size: [*c]usize) sys.esp_err_t;
pub extern fn uart_get_tx_buffer_free_size(uart_num: sys.uart_port_t, size: [*c]usize) sys.esp_err_t;
pub extern fn uart_disable_pattern_det_intr(uart_num: sys.uart_port_t) sys.esp_err_t;
pub extern fn uart_enable_pattern_det_baud_intr(uart_num: sys.uart_port_t, pattern_chr: u8, chr_num: u8, chr_tout: c_int, post_idle: c_int, pre_idle: c_int) sys.esp_err_t;
pub extern fn uart_pattern_pop_pos(uart_num: sys.uart_port_t) c_int;
pub extern fn uart_pattern_get_pos(uart_num: sys.uart_port_t) c_int;
pub extern fn uart_pattern_queue_reset(uart_num: sys.uart_port_t, queue_length: c_int) sys.esp_err_t;
pub extern fn uart_set_mode(uart_num: sys.uart_port_t, mode: sys.uart_mode_t) sys.esp_err_t;
pub extern fn uart_set_rx_full_threshold(uart_num: sys.uart_port_t, threshold: c_int) sys.esp_err_t;
pub extern fn uart_set_tx_empty_threshold(uart_num: sys.uart_port_t, threshold: c_int) sys.esp_err_t;
pub extern fn uart_set_rx_timeout(uart_num: sys.uart_port_t, tout_thresh: u8) sys.esp_err_t;
pub extern fn uart_get_collision_flag(uart_num: sys.uart_port_t, collision_flag: [*c]bool) sys.esp_err_t;
pub extern fn uart_set_wakeup_threshold(uart_num: sys.uart_port_t, wakeup_threshold: c_int) sys.esp_err_t;
pub extern fn uart_get_wakeup_threshold(uart_num: sys.uart_port_t, out_wakeup_threshold: [*c]c_int) sys.esp_err_t;
pub extern fn uart_wait_tx_idle_polling(uart_num: sys.uart_port_t) sys.esp_err_t;
pub extern fn uart_set_loop_back(uart_num: sys.uart_port_t, loop_back_en: bool) sys.esp_err_t;
pub extern fn uart_set_always_rx_timeout(uart_num: sys.uart_port_t, always_rx_timeout_en: bool) void;
