CREATE OR REPLACE FUNCTION fn_add_transaction(
    p_user_id UUID,
    p_wallet_id UUID,
    p_category_id UUID,
    p_amount NUMERIC,
    p_type VARCHAR,
    p_note TEXT DEFAULT NULL
)
RETURNS UUID AS $$
DECLARE
    new_id UUID;
BEGIN
    -- Insert transaction
    INSERT INTO transactions (user_id, wallet_id, category_id, amount, type, note)
    VALUES (p_user_id, p_wallet_id, p_category_id, p_amount, p_type, p_note)
    RETURNING id INTO new_id;

    -- Update wallet balance
    IF p_type = 'income' THEN
        UPDATE wallets SET balance = balance + p_amount WHERE id = p_wallet_id;
    ELSIF p_type = 'expense' THEN
        UPDATE wallets SET balance = balance - p_amount WHERE id = p_wallet_id;
    END IF;

    RETURN new_id;
END;
$$ LANGUAGE plpgsql;
