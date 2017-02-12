/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analizador;
/**
 *
 * @author Arturo
 */
public class Converter implements compiladorConstants{

    public static final String Null = "$";
    public static final String Void = "%";
    private final char newLine = '\n';
    private final char close = ';';
    private final StringBuilder symbols;
    private final StringBuilder functions;
    private final StringBuilder main;
    private final StringBuilder include;
    public static final int FUNCTIONS = 1;
    public static final int SYMBOLS = 2;
    public static final int MAINBLOCK = 3;
    private int currentContext = 0;
    private String result;

    public Converter() {
        include = new StringBuilder();
        include.append("#include <stdio.h>\n");
        include.append("#include <stdlib.h>\n");
        symbols = new StringBuilder();
        symbols.append("/*BLOQUE DE VARIABLES Y CONSTANTES*/\n");
        functions = new StringBuilder();
        functions.append("/*BLOQUE DE FUNCIONES*/\n");
        main = new StringBuilder();
        main.append("/*BLOQUE PRINCIPAL*/\n");
        openMain();
    }

    public void insertVariable(int kind, String id, String value, String index) {
        boolean isArray = !index.equals(Null);
        if (isArray) {
            main.append(getType(kind));
            main.append(" ");
            main.append(id);
            main.append("[");
            main.append(index);
            main.append("]");
            if(!value.equals(Null)){
                main.append(" = ");
                main.append("{");
                main.append(value);
                main.append("}");
                main.append(close);
                main.append(newLine);
            }
        }else{
            symbols.append(getType(kind));
            symbols.append(" ");
            symbols.append(id);
            symbols.append(close);
            symbols.append(newLine);
            if(!value.equals(Null)){
                insertAssignment(id, value, Null);
            }
        }
    }

    public void insertConstant(int kind, String id, String value) {
        symbols.append("const ");
        symbols.append(getType(kind));
        symbols.append(id);
        symbols.append(" = ");
        symbols.append(value);
        symbols.append(close);
        symbols.append(newLine);
    }

    public String getType(int kind) {
        String value = "";
        switch (kind) {
            case INT:
                value = "int ";
                break;
            case FLOAT:
                value = "float ";
                break;
        }
        return value;
    }

    public void insertAssignment(String id, String value, String index) {
        StringBuilder target = getContext();
        target.append(id);
        if (!index.equals(Null)) {
            target.append("[");
            target.append(index);
            target.append("]");
        }
        target.append(" = ");
        target.append(value);
        target.append(close);
        target.append(newLine);
    }
	
    public void closeBlock() {
        StringBuilder target = getContext();
        target.append("}");
        target.append(newLine);
    }

    public void openIF(String expression) {
        StringBuilder target = getContext();
        target.append("if(");
        target.append(expression);
        target.append("){");
        target.append(newLine);
    }

    public void openELSE() {
        StringBuilder target = getContext();
        target.append("else{ ");
        target.append(newLine);
    }

    public void openWhile(String expression) {
        StringBuilder target = getContext();
        target.append("while(");
        target.append(expression);
        target.append("){");
        target.append(newLine);
    }
	
    public void printElement(int valueKind, String value) {
        StringBuilder target = getContext();
        target.append("printf(");
        switch (valueKind) {
            case INT:
            case NUMERO:
                target.append("\"%d\",");
                break;
            case FLOAT:
            case DECIMAL:
                target.append("\"%f\",");
                break;
        }
        target.append(value);
        target.append(")");
        target.append(close);
        target.append(newLine);
    }

    public void inputElement(int valueKind, String id) {
        StringBuilder target = getContext();
        target.append("scanf(");
        switch (valueKind) {
            case INT:
                target.append("\"%d\",");
                break;
            case FLOAT:
                target.append("\"%f\",");
                break;
        }
        target.append("&");
        target.append(id);
        target.append(")");
        target.append(close);
        target.append(newLine);
    }

    public void setContext(int context) {
        currentContext = context;
    }

    private StringBuilder getContext() {
        switch (currentContext) {
            case FUNCTIONS:
                return functions;
            case SYMBOLS:
                return symbols;
            case MAINBLOCK:
                return main;
            default:
                return null;
        }
    }

    public void insert(String expression) {
        getContext().append(expression);
    }

    private void openMain() {
        main.append("int main(){");
        main.append(newLine);
    }

    private void closeMain() {
        main.append("return 0;\n");
        main.append("}");
    }

    private void pack() {
        StringBuilder constructor = new StringBuilder();
        closeMain();
        constructor.append(include);
        constructor.append(symbols);
        constructor.append(functions);
        constructor.append(main);
        result = constructor.toString();
    }

    public String getResult() {
        pack();
        return result;
    }

    public void printResult() {
        pack();
        System.out.println(result);
    }

}
