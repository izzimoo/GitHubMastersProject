function plotERP_WordN(time_axis, EEG_data, title_str)
    plot(EEG_data);
%     plot(time_axis, EEG_data);
%     xlim([time_axis(1),time_axis(end)]);
    xlabel('Time-latency (ms)'); ylabel('Magnitude (a.u.)');
    title(title_str);
end
