function freqs = get_freqs_from_fooof_results(fooof_results)
%GET_FREQS_FROM_FOOOF_RESULTS Extract frequency axis from FOOOF results.
%   FREQUENCIES = GET_FREQS_FROM_FOOOF_RESULTS(FOOOF_RESULTS) returns the
%   frequency vector stored in a FOOOF results structure array. The output
%   is always returned as a row vector. The function throws an error if
%   the frequency information cannot be located.
%
%   This helper centralises the logic for identifying the frequency vector
%   so that downstream scripts do not depend on residual workspace
%   variables.

    if isempty(fooof_results)
        error('fooof_results array is empty.');
    end

    candidate_fields = {
        'freqs', ...
        'frequencies'
    };

    freqs = [];

    for idx = 1:numel(candidate_fields)
        field_name = candidate_fields{idx};
        if isfield(fooof_results, field_name) && ~isempty(fooof_results(1).(field_name))
            freqs = fooof_results(1).(field_name);
            break;
        end
    end

    if isempty(freqs) && isfield(fooof_results, 'meta')
        meta = fooof_results(1).meta;
        if isstruct(meta)
            if isfield(meta, 'freqs') && ~isempty(meta.freqs)
                freqs = meta.freqs;
            elseif isfield(meta, 'frequencies') && ~isempty(meta.frequencies)
                freqs = meta.frequencies;
            end
        end
    end

    if isempty(freqs) && isfield(fooof_results, 'settings')
        settings = fooof_results(1).settings;
        if isstruct(settings)
            if isfield(settings, 'freqs') && ~isempty(settings.freqs)
                freqs = settings.freqs;
            elseif isfield(settings, 'frequencies') && ~isempty(settings.frequencies)
                freqs = settings.frequencies;
            end
        end
    end

    if isempty(freqs)
        error('Unable to determine frequency axis from FOOOF results.');
    end

    freqs = freqs(:)';
end
