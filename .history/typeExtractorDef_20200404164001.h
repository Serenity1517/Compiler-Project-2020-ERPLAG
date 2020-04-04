/*
 * Group no. 50
 * Aniruddha Mahajan -------- 2017A7PS0145P
 * Ravindra Singh Shekhawat - 2017A7PS0146P
 * Shreyas Srikrishna ------- 2017A7PS0162P
 * Chetan Sharma ------------ 2017A7PS0182P
 */

#ifndef typeExtractorDef
#define typeExtractorDef

typedef enum PrimitiveType{
    integer,
    real,
    boolean,
}PrimitiveType;

typedef struct ArrayType{
    PrimitiveType t;
    int low;
    int high;
    char left[21];
    char right[21];
}ArrayType;

typedef union VariableType{
    PrimitiveType primitiveType;
    ArrayType arrayType;
}VariableType;

typedef enum VariableTypeTag{
    primitive,
    array
}VariableTypeTag;

typedef struct Typeof{
    VariableType type;
    VariableTypeTag tag;
}Typeof;

typedef struct FunctionType{
    Typeof* inputList;      //array of types of input parameters
    Typeof* outputList;     //array of types of output parameters
    int noOfInputs;
    int noOfOutputs;
}FunctionType;


#endif