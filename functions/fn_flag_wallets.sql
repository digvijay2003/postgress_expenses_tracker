CREATE OR REPLACE FUNCTION fn_flag_wallets(threshold NUMERIC DEFAULT 1000)
RETURNS TABLE(wallet_id UUID, user_id UUID, balance NUMERIC) AS $$
BEGIN
    RETURN QUERY
    SELECT id, user_id, balance FROM wallets
    WHERE balance < threshold AND is_active = TRUE;
END;
$$ LANGUAGE plpgsql;
