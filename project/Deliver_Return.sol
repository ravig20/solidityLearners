// Smart Contract to receive customer order, deliver and manage returns

pragma solidity 0.4.21;

contract Order {
    uint256 public orderValue;
    address public sellerAddress;
    address public buyerAddress;
    enum orderState { Received, Confirmed, Completed, Cancelled }
    orderState public state;
    
    function Order() public payable {
        sellerAddress = msg.sender;
        orderValue = msg.value / 2;
        require((2 * orderValue) == msg.value);
    }
    modifier condition(bool _condition) {
        require(_condition);
        _;
    }
    modifier onlyBuyerAddress() {
        require(msg.sender == buyerAddress);
        _;
    }
    modifier onlySellerAddress() {
        require(msg.sender == sellerAddress);
        _;
    }
    modifier inOrderState(orderState _state) {
        require(state == _state);
        _;
    }
    event canceledOrder();
    event confirmedOrder();
    event receivedItem();
    
    // Order is cancelled and amount is returned
    function cancelOrder() public onlySellerAddress inOrderState(orderState.Received) {
        emit canceledOrder();
        state = orderState.Cancelled;
        sellerAddress.transfer(this.balance);
    }
    
    // Confirm the purchase
    function orderConfirm() public inOrderState(orderState.Received) condition(msg.value == (2 * orderValue)) payable {
        emit confirmedOrder();
        buyerAddress = msg.sender;
        state = orderState.Confirmed;
    }
    
    // Buyer confirms receipt of the order and amount is released
    function receivedConfirm() public onlyBuyerAddress inOrderState(orderState.Confirmed) {
        emit receivedItem();
        state = orderState.Completed;
        buyerAddress.transfer(orderValue);
        sellerAddress.transfer(this.balance);
    }
}