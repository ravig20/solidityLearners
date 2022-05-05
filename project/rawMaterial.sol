// Smart Contract to source raw materials
pragma solidity 0.4.21;

contract Source {
    address public seller;
    address public carrier;
    address public buyer;
    uint256 public purchasePrice;
    uint256 public carrierFee;
    
    enum WaitingFor { 
        BuyerEscrowPayment,
        SellerEscrowPayment,
        SellerRelease,
        CarrierAccept,
        CarrierRelease,
        BuyerAccept,
        Completed
    }
    WaitingFor state;

    function Source(
        address _seller,
        address _carrier,
        uint256 _carrierFee,
        uint256 _purchasePrice) public
    {
        buyer = msg.sender;
        seller = _seller;
        carrier = _carrier;
        carrierFee = _carrierFee;
        purchasePrice = _purchasePrice;
    }
    
    function reset(
        address _seller,
        address _carrier,
        uint _carrierFee,
        uint _purchasePrice) public
    {
        if (state != WaitingFor.Completed)
            revert();
        buyer = msg.sender;
        seller = _seller;
        carrier = _carrier;
        carrierFee = _carrierFee;
        purchasePrice = _purchasePrice;
    }

    function () payable public {

        if (state == WaitingFor.Completed)
            revert();
        if (msg.sender == buyer && state != WaitingFor.BuyerEscrowPayment && state != WaitingFor.BuyerAccept)
            revert();
        if (msg.sender == seller && state != WaitingFor.SellerEscrowPayment && state != WaitingFor.SellerRelease)
            revert();
        if (msg.sender == carrier && state != WaitingFor.CarrierAccept && state != WaitingFor.CarrierRelease)
            revert();

        if (state == WaitingFor.BuyerEscrowPayment && msg.value != 2 * purchasePrice + carrierFee)
            revert();
        if (state == WaitingFor.SellerEscrowPayment && msg.value != purchasePrice)
            revert();
        
        if (state == WaitingFor.BuyerEscrowPayment)
            state = WaitingFor.SellerEscrowPayment;
        else if (state == WaitingFor.SellerEscrowPayment)
            state = WaitingFor.SellerRelease;
        else if (state == WaitingFor.SellerRelease)
            state = WaitingFor.CarrierAccept;
        else if (state == WaitingFor.CarrierAccept)
            state = WaitingFor.CarrierRelease;
        else if (state == WaitingFor.CarrierRelease)
            state = WaitingFor.BuyerAccept;
        else if (state == WaitingFor.BuyerAccept) {
            state = WaitingFor.Completed;
            carrier.transfer(carrierFee);
            seller.transfer(2 * purchasePrice);
            buyer.transfer(purchasePrice);
        }
    }
}