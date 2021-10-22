module A::Coin {
    use Std::Signer;

    struct Coin<phantom CoinType> has key, store {
        value: u64,
    }

    public fun make_coin<CoinType>(value: u64): Coin<CoinType> {
        Coin { value }
    }

    public fun store_coin<CoinType>(account: &signer, coin: Coin<CoinType>) {
        move_to(account, coin)
    }

    public fun get_coin<CoinType>(account: &signer): Coin<CoinType>
    acquires Coin {
        move_from<Coin<CoinType>>(Signer::address_of(account))
    }
}
