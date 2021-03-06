CREATE TABLE COLLATERALIZED_LOAN_STATUS (
    LOAN_STATUS_CODE    INT NOT NULL,
    LOAN_STATUS_DESC    VARCHAR(255) NOT NULL,
    PRIMARY KEY(LOAN_STATUS_CODE),
    UNIQUE(LOAN_STATUS_CODE)
);

INSERT INTO COLLATERALIZED_LOAN_STATUS VALUES (0, 'LoanInitiated');
INSERT INTO COLLATERALIZED_LOAN_STATUS VALUES (1, 'LoanRequested');
INSERT INTO COLLATERALIZED_LOAN_STATUS VALUES (2, 'LoanCancelled');
INSERT INTO COLLATERALIZED_LOAN_STATUS VALUES (3, 'LoanRepaying');
INSERT INTO COLLATERALIZED_LOAN_STATUS VALUES (4, 'LoanDefaulted');
INSERT INTO COLLATERALIZED_LOAN_STATUS VALUES (5, 'LoanCompleted');
COMMIT;

CREATE TABLE COLLATERALIZED_LOAN (
    LOAN_ID                     INT NOT NULL,
    LOAN_AMOUNT                 NUMERIC NOT NULL,
    COLLATERAL_AMOUNT           NUMERIC NOT NULL,
    BORROWER                    VARCHAR(255),
    LENDER                      VARCHAR(255) NOT NULL,
    LOAN_STATUS_CODE            INT NOT NULL,
    LOAN_TERM                   INT NOT NULL,
    APR                         NUMERIC NOT NULL,
    REPAYMENT_SCHEDULE          INT NOT NULL,
    MONTHLY_REPAYMENT_AMOUNT    INT NOT NULL,
    REMAINING_REPAYMENT_COUNT   INT NOT NULL,
    NEXT_REPAYMENT_DEADLINE     TIMESTAMP,
    INITIAL_LTV                 INT NOT NULL,
    MARGIN_LTV                  INT NOT NULL,
    LIQUIDATION_LTV             INT NOT NULL,
    CREATE_TIME                 TIMESTAMP NOT NULL,
    LAST_UPDATE_TIME            TIMESTAMP NOT NULL,
    PRIMARY KEY(LOAN_ID),
    UNIQUE(LOAN_ID),
    CONSTRAINT FK_LOAN_STATUS_CODE
        FOREIGN KEY(LOAN_STATUS_CODE) 
            REFERENCES COLLATERALIZED_LOAN_STATUS(LOAN_STATUS_CODE)
);