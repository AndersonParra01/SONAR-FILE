/**
  Autor: Mario Cabrera / Alex Jordan / Mauricio Orozco / Anderson Parra / Carlos Puco
  Fecha: 10-septiembre-2024
  Proposito: creacion y actualizacion de productos / caracteristicas / valores en el Telcos.
  La fuente de datos es la nueva aplicacion Product Catalog en el esquema DB_PRODUCT
  Ejecutar: Ejecutar el paquete con el usuario DB_COMERCIAL
  Ruta: ~/Repositories/software-factory/bases-de-datos/oracle/objetos-db
  https://gitlab.telconet.ec/software-factory/bases-de-datos/oracle/objetos-db
  por ejemplo: sqlplus DB_COMERCIAL/Telconet_Dev@S104DE05 @DB_COMERCIAL/PACKAGES/PKS_REPLICAR_PRODUCTOS.pks
  SET SERVEROUTPUT ON
 */
CREATE OR REPLACE PACKAGE DB_COMERCIAL.PKS_REPLICAR_PRODUCTOS AS
  /**
   * Realiza la carga completa de un producto, incluyendo operaciones de CRUD (Crear, Actualizar, Eliminar).
   * @param P_ID_PRODUCT_OFFERING Identificador del producto que se va a cargar.
   * Autor: Anderson Parra
   * Fecha: 13-11-2024
   */
  PROCEDURE CARGAR_PRODUCTO (P_ID_PRODUCT_OFFERING NUMBER);  -- CRUD COMPLETO CREATE UPDATE Y DELETE LOGIC
  
   /**
   * Carga la categoría asociada a un producto específico.
   * @param P_ID_PRODUCTO Identificador del producto.
   * Autor: Anderson Parra
   * Fecha: 13-11-2024
   */
  PROCEDURE CARGAR_CATEG_OFFERING (P_ID_PRODUCTO NUMBER);

  /**
   * Carga el precio recurrente de un producto.
   * @param P_ID_PRODUCTO Identificador del producto.
   * Autor: Anderson Parra
   * Fecha: 13-11-2024
   */
  PROCEDURE CARGAR_PRODUCTO_PRECIO_RECURRENTE (P_ID_PRODUCTO NUMBER);

   /**
   * Carga el precio de instalación de un producto.
   * @param P_ID_PRODUCTO Identificador del producto.
   * Autor: Anderson Parra
   * Fecha: 13-11-2024
   */
  PROCEDURE CARGAR_PRODUCTO_PRECIO_INSTALACION (P_ID_PRODUCTO NUMBER);

   /**
   * Carga el impuesto asociado a un producto específico.
   * @param P_ID_PRODUCTO_IMPUESTO Identificador del producto para el impuesto.
   * Autor: Anderson Parra
   * Fecha: 13-11-2024
   */
  PROCEDURE CARGAR_PRODUCTO_PRECIO_IMPUESTO(P_ID_PRODUCTO_IMPUESTO NUMBER);

   /**
   * Carga los terminos y condiciones de un producto.
   * @param P_ID_PRODUCTO Identificador del producto.
   * Autor: Anderson Parra
   * Fecha: 13-11-2024
   */
  PROCEDURE CARGAR_PRODUCTO_T_C (P_ID_PRODUCTO NUMBER);

  /**
   * Realiza la carga completa de características de un producto, incluyendo operaciones CRUD.
   * @param P_ID_CARACTERISTICA_PRODUCTO Identificador de la característica del producto.
   * Autor: Anderson Parra
   * Fecha: 13-11-2024
   */
  PROCEDURE CARGAR_CARACTERISTICA (P_ID_CARACTERISTICA_PRODUCTO NUMBER); -- CRUD COMPLETO CREATE UPDATE Y DELETE LOGIC

   /**
   * Obtiene el ID de una característica a partir de su descripción.
   * @param P_DESCRIPCION_CARACTERISTICA Descripción de la característica.
   * @return Retorna el número de identificación de la característica.
   * Autor: Anderson Parra
   * Fecha: 13-11-2024
   */
  FUNCTION OBTENER_ID_CARACTERISTICA (P_DESCRIPCION_CARACTERISTICA VARCHAR2) RETURN NUMBER;

   /**
   * Lista las características de un producto específico.
   * @param P_ID_CARACTERISTICA_PRODUCTO Identificador de la característica del producto.
   * @param P_ID_PRODUCT_OFFERING Identificador de la oferta del producto.
   * Autor: Anderson Parra
   * Fecha: 13-11-2024
   */
  PROCEDURE LISTAR_PRODUCTO_CARACTERISTICAS(P_ID_CARACTERISTICA_PRODUCTO NUMBER, P_ID_PRODUCT_OFFERING NUMBER);

  /**
   * Carga el valor de una característica específica.
   * @param P_ID_VALOR_CARACTERISTICA Identificador del valor de la característica.
   * Autor: Anderson Parra
   * Fecha: 13-11-2024
   */
  PROCEDURE CARGAR_VALOR_CARACTERISTICA (P_ID_VALOR_CARACTERISTICA NUMBER);

   /**
   * Actualiza la categoría asociada a un producto.
   * @param P_ID_CATEGORIA Identificador de la categoría.
   * Autor: Anderson Parra
   * Fecha: 13-11-2024
   */
  PROCEDURE ACTUALIZAR_CATEGORIA_ASOCIADA(P_ID_CATEGORIA NUMBER);

  /**
   * Carga el nombre técnico de una característica con un valor específico.
   * @param P_ID_VALUE Identificador del valor.
   * @param P_ID_CHARACTERISTIC Identificador de la característica.
   * Autor: Anderson Parra
   * Fecha: 13-11-2024
   */
  PROCEDURE CARGAR_VALOR_CARACTERISTICA_NOMBRE_TECNICO(P_ID_VALUE NUMBER,  P_ID_CHARACTERISTIC NUMBER);

  /**
   * Carga las características de los servicios asociados a un producto.
   * @param P_ID_CARACTERISTICA_PRODUCTO Identificador de la característica del producto.
   * Autor: Anderson Parra
   * Fecha: 13-11-2024
   */
  PROCEDURE CARGAR_CARACTERISTICAS_SERVICIOS(P_ID_CARACTERISTICA_PRODUCTO NUMBER);

  /**
   * Inserta una nueva característica para un producto.
   * @param V_CHARNAME Nombre de la característica.
   * @param P_PRODUCT_ID Identificador del producto.
   * @param P_CARACTERISTICA_ID Identificador de la característica.
   * @param P_CREATION_USER Usuario que realiza la creación.
   * @param P_CHARSTATUS Estado de la característica.
   * @param P_VISIBLE Visibilidad de la característica.
   * Autor: Anderson Parra
   * Fecha: 13-11-2024
   */
  PROCEDURE INSERTAR_CARACTERISTICA_PRODUCTO(
    V_CHARNAME VARCHAR2,
    P_PRODUCT_ID NUMBER,
    P_CARACTERISTICA_ID NUMBER,
    P_CREATION_USER VARCHAR2,
    P_CHARSTATUS VARCHAR2,
    P_VISIBLE VARCHAR2
  );

  /**
   * Constante con el valor de "Activo"
   * Autor: Anderson Parra
   * Fecha: 13-11-2024
   */
  CONST_ESTADO_ACTIVO VARCHAR2(20) := 'Activo';

  /**
   * Constante con el valor de "Activo"
   * Autor: Anderson Parra
   * Fecha: 13-11-2024
   */
  CONST_NOMBRE_TECNICO VARCHAR2(20) := 'NOMBRE_TECNICO';

  /**
   * Constante con el valor de "IP_ADDRESS"
   * Autor: Anderson Parra
   * Fecha: 13-11-2024
   */
  CONST_IP VARCHAR2(20) := 'IP_ADDRESS';

  /**
   * Constante con el valor de "USERENV"
   * Autor: Anderson Parra
   * Fecha: 13-11-2024
   */
  CONST_USER VARCHAR2(20) := 'USERENV';

  /**
   * Constante con el valor de "USERENV"
   * Autor: Anderson Parra
   * Fecha: 13-11-2024
   */
  CONST_ESTADO_ANULADO VARCHAR2(20) := 'Anulado';

  /**
   * Constante con el valor de "PROD_"
   * Autor: Anderson Parra
   * Fecha: 13-11-2024
   */
  CONST_WORD_PROD VARCHAR2(20) := 'PROD_';

 END PKS_REPLICAR_PRODUCTOS;
/

/*

 */
CREATE OR REPLACE PACKAGE BODY DB_COMERCIAL.PKS_REPLICAR_PRODUCTOS
AS
/**
 * Carga información completa de un producto, incluyendo lógica de creación,
 * actualización y eliminación.
 *
 * @param P_ID_PRODUCT_OFFERING Número de identificación del producto a cargar.
 * @author Anderson Parra
 * @version 1.0 12/11/2024
 */
PROCEDURE CARGAR_PRODUCTO (P_ID_PRODUCT_OFFERING NUMBER) IS
   NORECS NUMBER;
   L_ID NUMBER;
   L_ORG_ID NUMBER(8);
   L_OfferingName VARCHAR2(80);
   L_MNEMONIC VARCHAR2(8);
   L_OfferingStatus VARCHAR2(40);
   L_Offering_CreationDate DATE;
   L_Offering_CreationUser VARCHAR2(40);
   L_IP VARCHAR2(20);
   L_PRODUCT_SPECIFICATION_ID NUMBER(8);

   V_HAS_CARACTERISTICAS NUMBER;
   V_HAS_TERMINOS NUMBER;

      -- Definición de una colección para los valores de NOMBRE_TECNICO
   TYPE NombreTecnicoTable IS TABLE OF VARCHAR2(255) INDEX BY PLS_INTEGER;
   tec_caracteristica_values NombreTecnicoTable;

   -- Definición de una colección para los IDs de producto
  TYPE ProductoIdTable IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
  producto_ids ProductoIdTable;

  CURSOR caracteristicas_cursor IS
      SELECT c.ID_PROD_SPEC_CHARACTERISTIC
      FROM DB_PRODUCT.ADMI_PRODUCT_OFFERING o
      INNER JOIN DB_PRODUCT.ADMI_PRODUCT_SPECIFICATION e ON e.ID_PRODUCT_SPECIFICATION = o.PRODUCT_SPECIFICATION_ID
      INNER JOIN DB_PRODUCT.ADMI_PROD_SPEC_CHARACTERISTIC c ON c.PRODUCT_SPECIFICATION_ID = e.ID_PRODUCT_SPECIFICATION
      WHERE o.ID_PRODUCT_OFFERING = P_ID_PRODUCT_OFFERING
      AND c.STATUS = CONST_ESTADO_ACTIVO;

  CURSOR caracteristicas_tec_cursor IS
      SELECT c.ID_PROD_SPEC_CHARACTERISTIC, c.NAME, c.VALUE_TYPE, chr.VALUE 
      FROM DB_PRODUCT.ADMI_PRODUCT_OFFERING o
      INNER JOIN DB_PRODUCT.ADMI_PRODUCT_SPECIFICATION e ON e.ID_PRODUCT_SPECIFICATION = o.PRODUCT_SPECIFICATION_ID
      INNER JOIN DB_PRODUCT.ADMI_PROD_SPEC_CHARACTERISTIC c ON c.PRODUCT_SPECIFICATION_ID = e.ID_PRODUCT_SPECIFICATION
      INNER JOIN DB_PRODUCT.ADMI_PROD_SPEC_CHAR_VALUE chr ON chr.PRODUCT_SPEC_CHAR_ID = c.ID_PROD_SPEC_CHARACTERISTIC
      WHERE o.ID_PRODUCT_OFFERING = P_ID_PRODUCT_OFFERING
      AND c.STATUS = CONST_ESTADO_ACTIVO
      AND chr.STATUS = CONST_ESTADO_ACTIVO
      AND c.IS_UNIQUE = 1
      AND c.NAME = CONST_NOMBRE_TECNICO
      ORDER BY chr.CREATION_DATE DESC
      FETCH FIRST 1 ROWS ONLY;

   PROCEDURE ActualizarInformacionProducto IS
   BEGIN
       -- Si el producto ya existe, actualizamos la información básica
       UPDATE DB_COMERCIAL.ADMI_PRODUCTO
       SET CODIGO_PRODUCTO = L_MNEMONIC,
           DESCRIPCION_PRODUCTO = L_OfferingName,
           ESTADO = L_OfferingStatus
       WHERE ID_PRODUCTO = P_ID_PRODUCT_OFFERING;
       DBMS_OUTPUT.PUT_LINE('ACTUALIZANDO PRODUCTO ID:' || P_ID_PRODUCT_OFFERING);
   END ActualizarInformacionProducto;

   PROCEDURE InsertarNuevoProducto IS
   BEGIN
       -- Si no existe, insertamos un nuevo registro
       INSERT INTO DB_COMERCIAL.ADMI_PRODUCTO
       (ID_PRODUCTO,
        EMPRESA_COD,
        DESCRIPCION_PRODUCTO,
        CODIGO_PRODUCTO,
        ESTADO,
        FE_CREACION,
        USR_CREACION,
        IP_CREACION,
        CTA_CONTABLE_PROD_NC,
        ES_PREFERENCIA,
        ES_ENLACE,
        REQUIERE_PLANIFICACION,
        REQUIERE_INFO_TECNICA,
        NOMBRE_TECNICO,
        CTA_CONTABLE_DESC,
        TIPO,
        ES_CONCENTRADOR,
        FUNCION_PRECIO,
        SOPORTE_MASIVO,
        ESTADO_INICIAL,
        GRUPO, 
        COMISION_VENTA,
        COMISION_MANTENIMIENTO,
        USR_GERENTE,
        CLASIFICACION,
        REQUIERE_COMISIONAR,
        SUBGRUPO,
        LINEA_NEGOCIO,
        FRECUENCIA,
        TERMINO_CONDICION
       )
       VALUES
       (P_ID_PRODUCT_OFFERING,
        L_ORG_ID,
        L_OfferingName,
        L_MNEMONIC,
        L_OfferingStatus,
        L_Offering_CreationDate,
        L_Offering_CreationUser,
        L_IP,
        NULL,
        'NO',
        'NO',
        'NO',
        'NO',
        'OTROS',
        NULL,
        'S',
        'NO',
        NULL,
        'S', 
        'Pendiente', 
        'NA',  
        NULL, 
        NULL, 
        NULL,
        NULL, 
        'SI', 
        'NA', 
        'NA', 
        NULL,
        NULL);
       DBMS_OUTPUT.PUT_LINE('PRODUCTO NUEVO INSERTADO');
       COMMIT;
   END InsertarNuevoProducto;

BEGIN
    -- Verificar si el producto ya existe en la tabla comercial
    SELECT p.ID_PRODUCT_OFFERING, p.PRODUCT_SPECIFICATION_ID, ORGANIZATION_ID, p.NAME AS OfferName,
           p.MNEMONIC, p.STATUS,
           p.CREATION_DATE, p.CREATION_USER, (SYS_CONTEXT(CONST_USER, CONST_IP)) AS IP
    INTO L_ID, L_PRODUCT_SPECIFICATION_ID, L_ORG_ID, L_OfferingName,
         L_MNEMONIC, L_OfferingStatus,
         L_Offering_CreationDate, L_Offering_CreationUser, L_IP
    FROM DB_PRODUCT.ADMI_PRODUCT_OFFERING p
    INNER JOIN DB_PRODUCT.ADMI_PROD_OFFER_RELATED_ORG o ON o.PRODUCT_OFFERING_ID = p.ID_PRODUCT_OFFERING
    WHERE p.ID_PRODUCT_OFFERING = P_ID_PRODUCT_OFFERING;
   
    -- Verificar si el estado es 'Anulado' y actualizar en caso de ser necesario
    IF L_OfferingStatus = CONST_ESTADO_ANULADO THEN
        UPDATE DB_COMERCIAL.ADMI_PRODUCTO
        SET ESTADO = CONST_ESTADO_ANULADO
        WHERE ID_PRODUCTO = P_ID_PRODUCT_OFFERING;
        DBMS_OUTPUT.PUT_LINE('Producto con ID: ' || P_ID_PRODUCT_OFFERING || ' actualizado a Anulado.');

    ELSIF L_PRODUCT_SPECIFICATION_ID IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('El producto con ID: ' || P_ID_PRODUCT_OFFERING || ' no tiene una especificación de producto, terminando ejecución.');

    ELSIF L_OfferingStatus = CONST_ESTADO_ACTIVO THEN
        -- Verificar si ya existe en la tabla comercial
        SELECT COUNT(*)
        INTO NORECS
        FROM DB_COMERCIAL.ADMI_PRODUCTO
        WHERE ID_PRODUCTO = P_ID_PRODUCT_OFFERING;

        IF NORECS > 0 THEN
            ActualizarInformacionProducto;
        ELSE
            InsertarNuevoProducto;
        END IF;

        DBMS_OUTPUT.PUT_LINE('VERIFICANDO SI HAY CARACTERISTICAS...');
        SELECT COUNT(*)
        INTO V_HAS_CARACTERISTICAS
        FROM DB_PRODUCT.ADMI_PRODUCT_OFFERING o
        INNER JOIN DB_PRODUCT.ADMI_PRODUCT_SPECIFICATION e ON e.ID_PRODUCT_SPECIFICATION = o.PRODUCT_SPECIFICATION_ID
        INNER JOIN DB_PRODUCT.ADMI_PROD_SPEC_CHARACTERISTIC c ON c.PRODUCT_SPECIFICATION_ID = e.ID_PRODUCT_SPECIFICATION
        WHERE o.ID_PRODUCT_OFFERING = P_ID_PRODUCT_OFFERING
        AND c.STATUS = CONST_ESTADO_ACTIVO;

        IF V_HAS_CARACTERISTICAS > 0 THEN
            FOR caracteristica IN caracteristicas_cursor LOOP
                DBMS_OUTPUT.PUT_LINE('Procesando característica con ID: ' || caracteristica.ID_PROD_SPEC_CHARACTERISTIC);
                LISTAR_PRODUCTO_CARACTERISTICAS(caracteristica.ID_PROD_SPEC_CHARACTERISTIC, P_ID_PRODUCT_OFFERING);
            END LOOP;

        DECLARE
            idx INTEGER := 0;
        BEGIN
            -- Rellenar las colecciones con los valores de NOMBRE_TECNICO y ID_PRODUCTO
            FOR tec_caracteristica IN caracteristicas_tec_cursor LOOP
                idx := idx + 1;
                tec_caracteristica_values(idx) := tec_caracteristica.VALUE;
                producto_ids(idx) := P_ID_PRODUCT_OFFERING;
            END LOOP;

            -- Usar FORALL para actualizar en lote
            FORALL i IN 1..tec_caracteristica_values.COUNT SAVE EXCEPTIONS
                UPDATE DB_COMERCIAL.ADMI_PRODUCTO
                SET NOMBRE_TECNICO = tec_caracteristica_values(i)
                WHERE ID_PRODUCTO = producto_ids(i);

            DBMS_OUTPUT.PUT_LINE('NOMBRE_TECNICO migrado para el producto con ID: ' || P_ID_PRODUCT_OFFERING);
            EXCEPTION
            WHEN OTHERS THEN
              -- Recorrer todos los errores individuales en el FORALL usando un WHILE
              DECLARE
                i INTEGER := 1;
              BEGIN
                WHILE i <= SQL%BULK_EXCEPTIONS.COUNT LOOP
                  DBMS_OUTPUT.PUT_LINE('Error en el índice: ' || SQL%BULK_EXCEPTIONS(i).ERROR_INDEX || 
                                      ', Código de error: ' || SQL%BULK_EXCEPTIONS(i).ERROR_CODE || 
                                      ', Mensaje: ' || SQLERRM(SQL%BULK_EXCEPTIONS(i).ERROR_CODE));
                  -- Aquí puedes agregar lógica adicional para registrar los errores en una tabla de logs
                  i := i + 1;
                END LOOP;
              END;
        END;
 
        ELSE
            DBMS_OUTPUT.PUT_LINE('NO HAY CARACTERISTICAS PARA ESTE PRODUCTO');
        END IF;

        DBMS_OUTPUT.PUT_LINE('VERIFICANDO SI HAY TERMINOS Y CONDICIONES...');
        SELECT COUNT(*)
        INTO V_HAS_TERMINOS
        FROM DB_PRODUCT.ADMI_PRODUCT_OFFERING p
        INNER JOIN DB_PRODUCT.ADMI_PROD_OFFERING_T_C t ON t.PRODUCT_OFFERING_ID = p.ID_PRODUCT_OFFERING
        WHERE p.ID_PRODUCT_OFFERING = P_ID_PRODUCT_OFFERING
        AND t.STATUS = CONST_ESTADO_ACTIVO
        FETCH FIRST 1 ROWS ONLY;

        IF V_HAS_TERMINOS > 0 THEN
            CARGAR_PRODUCTO_T_C(P_ID_PRODUCT_OFFERING);
        ELSE 
            DBMS_OUTPUT.PUT_LINE('NO HAY TERMINOS Y CONDICIONES PARA ESTE PRODUCTO');
        END IF;

        COMMIT;
    ELSE
        DBMS_OUTPUT.PUT_LINE('El producto con ID: ' || P_ID_PRODUCT_OFFERING || ' no está en estado Activo.');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró un producto con el ID: ' || P_ID_PRODUCT_OFFERING);
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al procesar el producto con ID: ' || P_ID_PRODUCT_OFFERING || ' - ' || SQLERRM);
END CARGAR_PRODUCTO;


/**
 * Carga la informacion de terminos y condiciones.
 *
 * @param P_ID_PRODUCTO Número de identificación del producto.
 * @autor Anderson Parra
 * @version 1.0 12/11/2024
 */
PROCEDURE CARGAR_PRODUCTO_T_C (P_ID_PRODUCTO NUMBER) IS
    NORECS NUMBER;
    V_STATUS VARCHAR2(50);
    V_DESCRIPTION CLOB;
BEGIN
    -- Verificar existencia del producto
    SELECT COUNT(*)
    INTO NORECS
    FROM DB_COMERCIAL.ADMI_PRODUCTO
    WHERE ID_PRODUCTO = P_ID_PRODUCTO;

    IF NORECS = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró el producto con ID: ' || P_ID_PRODUCTO);
    ELSE
        BEGIN
            -- Obtener la descripción y el estado del término y condición
            SELECT t.DESCRIPTION, t.STATUS
            INTO V_DESCRIPTION, V_STATUS
            FROM DB_PRODUCT.ADMI_PRODUCT_OFFERING p
            INNER JOIN DB_PRODUCT.ADMI_PROD_OFFERING_T_C t ON t.PRODUCT_OFFERING_ID = p.ID_PRODUCT_OFFERING
            WHERE p.ID_PRODUCT_OFFERING = P_ID_PRODUCTO
            AND t.STATUS = CONST_ESTADO_ACTIVO
            ORDER BY t.CREATION_DATE DESC, t.LAST_UPDATE_DATE DESC
            FETCH FIRST 1 ROWS ONLY;

            -- Actualizar el producto con la descripción si el estado es activo
            DBMS_OUTPUT.PUT_LINE('El estado es Activo. Actualizando TERMINO_CONDICION con DESCRIPCION.');
            UPDATE DB_COMERCIAL.ADMI_PRODUCTO
            SET TERMINO_CONDICION = V_DESCRIPTION
            WHERE ID_PRODUCTO = P_ID_PRODUCTO;

            COMMIT;
            DBMS_OUTPUT.PUT_LINE('Actualización completada para el producto con ID: ' || P_ID_PRODUCTO);

        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                -- Si no se encuentra ningún término en estado activo, establecer TERMINO_CONDICION a NULL
                DBMS_OUTPUT.PUT_LINE('No se encontró ningún término en estado Activo. Actualizando TERMINO_CONDICION a NULL.');
                UPDATE DB_COMERCIAL.ADMI_PRODUCTO
                SET TERMINO_CONDICION = NULL
                WHERE ID_PRODUCTO = P_ID_PRODUCTO;
                COMMIT;
                DBMS_OUTPUT.PUT_LINE('Actualización completada para el producto con ID: ' || P_ID_PRODUCTO || ' a NULL.');
            WHEN OTHERS THEN
                -- Manejo de otros errores
                ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('Error al procesar el producto con ID: ' || P_ID_PRODUCTO || ' - ' || SQLERRM);
        END;
    END IF;
END CARGAR_PRODUCTO_T_C;



/**
 * Carga los datos del precio recurrente para un producto específico.
 *
 * @param P_ID_PRODUCTO Número de identificación del producto.
 * @autor Anderson Parra
 * @version 1.0 12/11/2024
 */
   PROCEDURE CARGAR_PRODUCTO_PRECIO_RECURRENTE (P_ID_PRODUCTO NUMBER) IS
    NORECS NUMBER;
    CURSOR CPROD IS
     SELECT o.ID_PRODUCT_OFFERING, p.PRICE_TYPE, p.FINAL_PRICE_VALUE, f.LOGIC_SPECIFICATION
     FROM DB_PRODUCT.ADMI_PRODUCT_OFFERING o
     INNER JOIN DB_PRODUCT.ADMI_PROD_OFFERING_PRICE p ON p.PRODUCT_OFFERING_ID = o.ID_PRODUCT_OFFERING
     LEFT JOIN DB_PRODUCT.ADMI_PROD_OFFER_PRICE_LOGIC f ON f.PRODUCT_OFFER_PRICE_ID = p.ID_PROD_OFFERING_PRICE
     WHERE o.ID_PRODUCT_OFFERING = P_ID_PRODUCTO
     AND p.PRICE_TYPE = 'MRC'
     AND p.STATUS = CONST_ESTADO_ACTIVO
     ORDER BY p.CREATION_DATE DESC, p.LAST_UPDATE_DATE DESC
     FETCH FIRST 1 ROWS ONLY;
   PROD_REC CPROD%ROWTYPE;
   BEGIN
     OPEN CPROD;
    FETCH CPROD INTO PROD_REC;
     IF CPROD%NOTFOUND THEN
      UPDATE DB_COMERCIAL.ADMI_PRODUCTO
      SET FUNCION_PRECIO = NULL
      WHERE ID_PRODUCTO = P_ID_PRODUCTO;
    ELSE
    SELECT COUNT(*)
      INTO NORECS
      FROM DB_COMERCIAL.ADMI_PRODUCTO
      WHERE ID_PRODUCTO = P_ID_PRODUCTO;

      IF (NORECS > 0) THEN
        IF (PROD_REC.FINAL_PRICE_VALUE > 0) THEN
          UPDATE DB_COMERCIAL.ADMI_PRODUCTO
          SET FUNCION_PRECIO ='PRECIO=' || TO_CHAR(PROD_REC.FINAL_PRICE_VALUE)
          WHERE ID_PRODUCTO = PROD_REC.ID_PRODUCT_OFFERING;
        ELSE
          UPDATE DB_COMERCIAL.ADMI_PRODUCTO
          SET FUNCION_PRECIO = PROD_REC.LOGIC_SPECIFICATION
          WHERE ID_PRODUCTO = PROD_REC.ID_PRODUCT_OFFERING;
        END IF;
      END IF;
    END IF;
     CLOSE CPROD;
    COMMIT;
   END CARGAR_PRODUCTO_PRECIO_RECURRENTE;
 

/**
 * Carga los datos del precio de instalación para un producto específico.
 *
 * @param P_ID_PRODUCTO Número de identificación del producto.
 * @autor Anderson Parra
 * @version 1.0 12/11/2024
 */
/*
  Telcos no soporta logica de precio instalacion, por ende este campo debe de ser actualizado
  por medio de soporte.
*/
    PROCEDURE CARGAR_PRODUCTO_PRECIO_INSTALACION (P_ID_PRODUCTO NUMBER) IS
    NORECS NUMBER;
    CURSOR CPROD IS
      SELECT o.ID_PRODUCT_OFFERING, p.PRICE_TYPE, p.FINAL_PRICE_VALUE
      FROM DB_PRODUCT.ADMI_PRODUCT_OFFERING o
      INNER JOIN DB_PRODUCT.ADMI_PROD_OFFERING_PRICE p ON p.PRODUCT_OFFERING_ID = o.ID_PRODUCT_OFFERING
      WHERE o.ID_PRODUCT_OFFERING = P_ID_PRODUCTO
      AND p.PRICE_TYPE = 'NRC'
      AND p.STATUS = CONST_ESTADO_ACTIVO
      ORDER BY p.CREATION_DATE DESC, p.LAST_UPDATE_DATE DESC
      FETCH FIRST 1 ROWS ONLY;
    PROD_REC CPROD%ROWTYPE;
  BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Inicio del procedimiento ---');
    DBMS_OUTPUT.PUT_LINE('ID del producto: ' || P_ID_PRODUCTO);

    OPEN CPROD;
    FETCH CPROD INTO PROD_REC;
    DBMS_OUTPUT.PUT_LINE('Cursor abierto y ejecutado.');

    IF CPROD%NOTFOUND THEN
      DBMS_OUTPUT.PUT_LINE('No se encontro ningun registro en el cursor.');
      
      UPDATE DB_COMERCIAL.ADMI_PRODUCTO
      SET INSTALACION = NULL
      WHERE ID_PRODUCTO = P_ID_PRODUCTO;

      DBMS_OUTPUT.PUT_LINE('Campo INSTALACION actualizado a NULL para ID_PRODUCTO: ' || P_ID_PRODUCTO);

    ELSE
      DBMS_OUTPUT.PUT_LINE('Se encontro un registro en el cursor.');
      DBMS_OUTPUT.PUT_LINE('FINAL_PRICE_VALUE: ' || PROD_REC.FINAL_PRICE_VALUE);

      SELECT COUNT(*)
      INTO NORECS
      FROM DB_COMERCIAL.ADMI_PRODUCTO
      WHERE ID_PRODUCTO = P_ID_PRODUCTO;

      DBMS_OUTPUT.PUT_LINE('Numero de registros en ADMI_PRODUCTO: ' || NORECS);

      IF (NORECS > 0) THEN
        IF (PROD_REC.FINAL_PRICE_VALUE > 0) THEN
          UPDATE DB_COMERCIAL.ADMI_PRODUCTO
          SET INSTALACION = TO_NUMBER(PROD_REC.FINAL_PRICE_VALUE)
          WHERE ID_PRODUCTO = PROD_REC.ID_PRODUCT_OFFERING;

          DBMS_OUTPUT.PUT_LINE('Campo INSTALACION actualizado con valor: ' || PROD_REC.FINAL_PRICE_VALUE);
        ELSE
          DBMS_OUTPUT.PUT_LINE('FINAL_PRICE_VALUE es 0, no se actualiza INSTALACION.');
        END IF;
      ELSE
        DBMS_OUTPUT.PUT_LINE('No se encontro ningun producto con ID_PRODUCTO: ' || P_ID_PRODUCTO);
      END IF;
    END IF;    
    CLOSE CPROD;
    DBMS_OUTPUT.PUT_LINE('Cursor cerrado.');

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Commit realizado.');
    DBMS_OUTPUT.PUT_LINE('--- Fin del procedimiento ---');
  END CARGAR_PRODUCTO_PRECIO_INSTALACION;



/**
 * Carga características de un producto, incluyendo lógica de creación,
 * actualización y eliminación.
 *
 * @param P_ID_CARACTERISTICA_PRODUCTO Número de identificación de la característica del producto.
 * @autor Anderson Parra
 * @version 1.0 12/11/2024
 */
PROCEDURE CARGAR_CARACTERISTICA (P_ID_CARACTERISTICA_PRODUCTO NUMBER) IS
    L_ID_CARACTERISTICA_TELCOS NUMBER;
    EXISTFEATURECOMERCIAL NUMBER;
    V_VALOR_CARACTERISTICA_SERVICIO VARCHAR2(255);
    L_ID_PRODUCTO_CARACTERISTICA NUMBER;

    -- Variables para almacenar los valores de los campos
    V_CHARNAME VARCHAR2(255);
    V_VALUE_TYPE VARCHAR2(5);
    V_CHARSTATUS VARCHAR2(20);
    V_CREATION_DATE DATE;
    V_CREATION_USER VARCHAR2(100);
    V_DESCRIPTION VARCHAR2(255);
    V_UNIQUE NUMBER;
    V_CONFIGURABLE NUMBER;
    V_VISIBLE VARCHAR2(255);

    CURSOR PRODUCTOS_CATEGORIAS_ASOCIADOS IS 
        SELECT o.ID_PRODUCT_OFFERING AS PRODUCT_ID,
               c.NAME AS NAME_CHARACTERISTIC
        FROM DB_PRODUCT.ADMI_PRODUCT_OFFERING o
        INNER JOIN DB_PRODUCT.ADMI_PRODUCT_SPECIFICATION e ON e.ID_PRODUCT_SPECIFICATION = o.PRODUCT_SPECIFICATION_ID
        INNER JOIN DB_PRODUCT.ADMI_PROD_SPEC_CHARACTERISTIC c ON c.PRODUCT_SPECIFICATION_ID = e.ID_PRODUCT_SPECIFICATION
        WHERE c.ID_PROD_SPEC_CHARACTERISTIC = P_ID_CARACTERISTICA_PRODUCTO
        ORDER BY c.CREATION_DATE DESC, c.LAST_UPDATE_DATE DESC;

    CURSOR CARACTERISTICAS_SERVICIOS IS 
        SELECT acv.VALUE 
        FROM DB_PRODUCT.ADMI_CONFIGURATION ac 
        INNER JOIN DB_PRODUCT.ADMI_CONFIGURATION_VALUE acv ON ac.ID_CONFIGURATION = acv.CONFIGURATION_ID 
        WHERE ac.DESCRIPTION = 'CARACTERISTICA_SERVICIO'
        AND acv.VALUE NOT IN (CONST_NOMBRE_TECNICO)
        AND ac.STATUS = CONST_ESTADO_ACTIVO;
    
BEGIN
    -- Verificar si la característica existe en DB_PRODUCTO y obtener los valores
    SELECT apsc.NAME,
           CASE apsc.VALUE_TYPE
               WHEN 'TEXTO' THEN 'T'
               WHEN 'LISTA' THEN 'S'
               WHEN 'ENTERO' THEN 'N'
               WHEN 'DECIMAL' THEN 'N'
               WHEN 'BOOLEAN' THEN 'O'
               ELSE 'C'
           END AS VALUE_TYPE,
           apsc.STATUS,
           apsc.IS_UNIQUE,
           apsc.IS_CONFIGURABLE,
           CASE apsc.IS_VISIBLE
               WHEN 0 THEN 'NO'
               WHEN 1 THEN 'SI'
               ELSE 'NO'
           END AS VISIBLE,
           apsc.DESCRIPTION,
           apsc.CREATION_DATE,
           apsc.CREATION_USER
    INTO V_CHARNAME, V_VALUE_TYPE, V_CHARSTATUS, V_UNIQUE, V_CONFIGURABLE, V_VISIBLE, V_DESCRIPTION, V_CREATION_DATE, V_CREATION_USER
    FROM DB_PRODUCT.ADMI_PROD_SPEC_CHARACTERISTIC apsc
    WHERE apsc.ID_PROD_SPEC_CHARACTERISTIC = P_ID_CARACTERISTICA_PRODUCTO;

    -- Verificar si el estado es "Anulado" en DB_PRODUCTO
    IF V_CHARSTATUS = CONST_ESTADO_ANULADO THEN
        DBMS_OUTPUT.PUT_LINE('La característica en DB_PRODUCTO tiene estado "Anulado". Actualizando en DB_COMERCIAL.');

        -- Actualizar la característica en DB_COMERCIAL como "Anulado"
        L_ID_PRODUCTO_CARACTERISTICA := OBTENER_ID_CARACTERISTICA(V_CHARNAME);

        UPDATE DB_COMERCIAL.ADMI_PRODUCTO_CARACTERISTICA
        SET ESTADO = 'Eliminado'
        WHERE CARACTERISTICA_ID = L_ID_PRODUCTO_CARACTERISTICA;

        CARGAR_VALOR_CARACTERISTICA_NOMBRE_TECNICO(NULL, L_ID_PRODUCTO_CARACTERISTICA);

        IF SQL%ROWCOUNT > 0 THEN
            DBMS_OUTPUT.PUT_LINE('Característica actualizada a "Eliminado" en DB_COMERCIAL.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('No se encontró la característica en DB_COMERCIAL para actualizar.');
        END IF;

    ELSE
        -- Verificar si la característica ya existe en DB_COMERCIAL
        DBMS_OUTPUT.PUT_LINE('Nombre de la característica: ' || V_CHARNAME);
        SELECT COUNT(*)
        INTO EXISTFEATURECOMERCIAL
        FROM DB_COMERCIAL.ADMI_CARACTERISTICA ac
        WHERE ac.DESCRIPCION_CARACTERISTICA = V_CHARNAME
        AND ac.ESTADO = CONST_ESTADO_ACTIVO;

        IF EXISTFEATURECOMERCIAL = 0 THEN
            DBMS_OUTPUT.PUT_LINE('La característica no existe en DB_COMERCIAL. Creando nueva característica.');

            -- Insertar nueva característica si no existe
            DBMS_OUTPUT.PUT_LINE('Generando nuevo ID.');
            SELECT DB_COMERCIAL.SEQ_ADMI_CARACTERISTICA.NEXTVAL
            INTO L_ID_CARACTERISTICA_TELCOS
            FROM DUAL;

            INSERT INTO DB_COMERCIAL.ADMI_CARACTERISTICA
            (ID_CARACTERISTICA, DESCRIPCION_CARACTERISTICA, TIPO_INGRESO, ESTADO, FE_CREACION, USR_CREACION, TIPO, DETALLE_CARACTERISTICA)
            VALUES
            (L_ID_CARACTERISTICA_TELCOS, V_CHARNAME, V_VALUE_TYPE, V_CHARSTATUS, SYSDATE, V_CREATION_USER, 'COMERCIAL', V_DESCRIPTION);

            DBMS_OUTPUT.PUT_LINE('Característica creada con ID: ' || L_ID_CARACTERISTICA_TELCOS);
            COMMIT;
        ELSE
            -- Si ya existe, mostrar un mensaje
            DBMS_OUTPUT.PUT_LINE('La característica ya existe en DB_COMERCIAL.');
        END IF;

        L_ID_PRODUCTO_CARACTERISTICA := OBTENER_ID_CARACTERISTICA(V_CHARNAME);
        DBMS_OUTPUT.PUT_LINE('ID de la característica recuperado: ' || L_ID_PRODUCTO_CARACTERISTICA);

        FOR PROD_CATE IN PRODUCTOS_CATEGORIAS_ASOCIADOS LOOP
            IF V_CONFIGURABLE = 1 AND V_VISIBLE = 'SI' THEN
                DBMS_OUTPUT.PUT_LINE('-------------Característica configurable y vendible: ' || V_CHARNAME || ' -----------');
                INSERTAR_CARACTERISTICA_PRODUCTO(V_CHARNAME, PROD_CATE.PRODUCT_ID, L_ID_PRODUCTO_CARACTERISTICA, V_CREATION_USER, V_CHARSTATUS, V_VISIBLE);
            END IF;

            IF V_UNIQUE = 1 AND V_CHARNAME = CONST_NOMBRE_TECNICO THEN
                DBMS_OUTPUT.PUT_LINE('--------------Característica con nombre técnico y IS_UNIQUE = 1: ' || V_CHARNAME || ' ----------');
                INSERTAR_CARACTERISTICA_PRODUCTO(V_CHARNAME, PROD_CATE.PRODUCT_ID, L_ID_PRODUCTO_CARACTERISTICA, V_CREATION_USER, V_CHARSTATUS, 'SI');
            END IF;
        END LOOP;

        -- Procesamiento de características de servicio
        FOR c IN CARACTERISTICAS_SERVICIOS LOOP 
            V_VALOR_CARACTERISTICA_SERVICIO := c.VALUE;
            IF V_VALOR_CARACTERISTICA_SERVICIO = V_CHARNAME THEN 
                DBMS_OUTPUT.PUT_LINE('-------Característica de servicio: ' || c.VALUE || ' ----------');
                CARGAR_CARACTERISTICAS_SERVICIOS(P_ID_CARACTERISTICA_PRODUCTO);
            END IF; 
        END LOOP;
        
        COMMIT;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Proceso completado para la característica ID: ' || P_ID_CARACTERISTICA_PRODUCTO);
END CARGAR_CARACTERISTICA;


/**
 * Obtiene el ID de una característica a partir de su descripción.
 *
 * @param P_DESCRIPCION_CARACTERISTICA Descripción textual de la característica.
 * @return Número de identificación de la característica.
 * @autor Anderson Parra
 * @version 1.0 12/11/2024
 */
    FUNCTION OBTENER_ID_CARACTERISTICA (P_DESCRIPCION_CARACTERISTICA VARCHAR2) RETURN NUMBER IS
      L_ID_CARACTERISTICA_TELCOS NUMBER;
    BEGIN
      -- Verificar si la caracteristica ya existe en DB_COMERCIAL
      SELECT ac.ID_CARACTERISTICA
      INTO L_ID_CARACTERISTICA_TELCOS
      FROM DB_COMERCIAL.ADMI_CARACTERISTICA ac
      WHERE ac.DESCRIPCION_CARACTERISTICA = P_DESCRIPCION_CARACTERISTICA
      AND ac.ESTADO = CONST_ESTADO_ACTIVO;

      RETURN L_ID_CARACTERISTICA_TELCOS;

    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        -- Si no se encuentra la caracteristica, retornar NULL
        RETURN NULL;
    END OBTENER_ID_CARACTERISTICA;
 
 
/**
 * Carga un valor específico para una característica.
 *
 * @param P_ID_VALOR_CARACTERISTICA Número de identificación del valor de la característica.
 * @autor Anderson Parra
 * @version 1.0 12/11/2024
 */
PROCEDURE CARGAR_VALOR_CARACTERISTICA (P_ID_VALOR_CARACTERISTICA NUMBER) IS
    NORECS NUMBER;
    L_ID_PARAMETER NUMBER;
    v_status VARCHAR2(20);
    FOUNDELEMENTS NUMBER := 0;

    CURSOR CPROD IS
        SELECT o.ID_PRODUCT_OFFERING, o.NAME,
               e.ID_PRODUCT_SPECIFICATION, e.NAME AS SPECNAME,
               c.ID_PROD_SPEC_CHARACTERISTIC, c.NAME AS CHARNAME,
               v.ID_PROD_SPEC_CHAR_VALUE, v.VALUE_TYPE, v.MEASURE_UNIT, v.VALUE, v.IS_DEFAULT,
               v.STATUS, v.CREATION_DATE, v.CREATION_USER, v.LAST_UPDATE_DATE, v.LAST_UPDATE_USER
          FROM DB_PRODUCT.ADMI_PRODUCT_OFFERING o
          INNER JOIN DB_PRODUCT.ADMI_PRODUCT_SPECIFICATION e ON e.ID_PRODUCT_SPECIFICATION = o.PRODUCT_SPECIFICATION_ID
          INNER JOIN DB_PRODUCT.ADMI_PROD_SPEC_CHARACTERISTIC c ON c.PRODUCT_SPECIFICATION_ID = e.ID_PRODUCT_SPECIFICATION
          INNER JOIN DB_PRODUCT.ADMI_PROD_SPEC_CHAR_VALUE v ON v.PRODUCT_SPEC_CHAR_ID = c.ID_PROD_SPEC_CHARACTERISTIC AND v.PRODUCT_SPECIFICATION_ID = c.PRODUCT_SPECIFICATION_ID
          INNER JOIN DB_PRODUCT.INFO_PROD_OFFER_SPEC_CHAR_VALUE_USE u ON u.PRODUCT_OFFER_ID = o.ID_PRODUCT_OFFERING AND u.PRODUCT_SPEC_CHAR_VALUE_ID = v.ID_PROD_SPEC_CHAR_VALUE
        WHERE v.ID_PROD_SPEC_CHAR_VALUE = P_ID_VALOR_CARACTERISTICA
          AND c.IS_CONFIGURABLE = 1
          AND v.STATUS = CONST_ESTADO_ACTIVO
          AND c.STATUS = CONST_ESTADO_ACTIVO
        ORDER BY v.CREATION_DATE DESC, v.LAST_UPDATE_DATE DESC;

    PROD_REC CPROD%ROWTYPE;

BEGIN
    DBMS_OUTPUT.PUT_LINE('VALIDANDO EL ESTADO DEL VALOR DE CARACTERISTICA');

    -- Validación del estado de la característica
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Verificando NOMBRE_TECNICO...');
        CARGAR_VALOR_CARACTERISTICA_NOMBRE_TECNICO(P_ID_VALOR_CARACTERISTICA, NULL);

        SELECT STATUS INTO v_status
        FROM DB_PRODUCT.ADMI_PROD_SPEC_CHAR_VALUE apscv
        WHERE apscv.ID_PROD_SPEC_CHAR_VALUE = P_ID_VALOR_CARACTERISTICA;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No se encontró el valor de característica con ID: ' || P_ID_VALOR_CARACTERISTICA);
            v_status := NULL;
    END;

    IF v_status IS NOT NULL THEN
        IF v_status = CONST_ESTADO_ANULADO THEN
            UPDATE DB_GENERAL.ADMI_PARAMETRO_DET apd
            SET ESTADO = 'Eliminado'
            WHERE apd.ID_PARAMETRO_DET = P_ID_VALOR_CARACTERISTICA;

            IF SQL%ROWCOUNT > 0 THEN
                DBMS_OUTPUT.PUT_LINE('Eliminación lógica completada para el valor de característica ID: ' || P_ID_VALOR_CARACTERISTICA);
            ELSE
                DBMS_OUTPUT.PUT_LINE('No se encontró el valor de característica con ID: ' || P_ID_VALOR_CARACTERISTICA || ' en la tabla de destino.');
            END IF;
        ELSE
            DBMS_OUTPUT.PUT_LINE('El valor de característica con ID ' || P_ID_VALOR_CARACTERISTICA || ' no está en estado Anulado.');

            -- Procesamiento del cursor
            FOR PROD_REC IN CPROD LOOP
                FOUNDELEMENTS := 1;

                BEGIN
                    SELECT COUNT(*) INTO NORECS
                    FROM DB_GENERAL.ADMI_PARAMETRO_CAB
                    WHERE NOMBRE_PARAMETRO = CONST_WORD_PROD || PROD_REC.CHARNAME;
                EXCEPTION
                    WHEN NO_DATA_FOUND THEN
                        NORECS := 0;
                END;

                IF (NORECS > 0) THEN
                    BEGIN
                        SELECT COUNT(*) INTO NORECS
                        FROM DB_GENERAL.ADMI_PARAMETRO_DET h
                        WHERE h.DESCRIPCION = CONST_WORD_PROD || PROD_REC.CHARNAME
                          AND VALOR1 = PROD_REC.VALUE;
                    EXCEPTION
                        WHEN NO_DATA_FOUND THEN
                            NORECS := 0;
                    END;

                    IF (NORECS = 0) THEN
                        BEGIN
                            SELECT ID_PARAMETRO INTO L_ID_PARAMETER
                            FROM DB_GENERAL.ADMI_PARAMETRO_CAB h
                            WHERE h.DESCRIPCION = CONST_WORD_PROD || PROD_REC.CHARNAME;
                        EXCEPTION
                            WHEN NO_DATA_FOUND THEN
                                DBMS_OUTPUT.PUT_LINE('No se encontró el ID_PARAMETRO para la descripción: ' || CONST_WORD_PROD || PROD_REC.CHARNAME);
                                CONTINUE;
                        END;

                        INSERT INTO DB_GENERAL.ADMI_PARAMETRO_DET
                        (ID_PARAMETRO_DET, PARAMETRO_ID, DESCRIPCION, VALOR1, ESTADO, USR_CREACION, FE_CREACION, IP_CREACION)
                        VALUES
                        (DB_GENERAL.SEQ_ADMI_PARAMETRO_DET.NEXTVAL, L_ID_PARAMETER,
                         CONST_WORD_PROD || PROD_REC.CHARNAME, PROD_REC.VALUE,
                         PROD_REC.STATUS, PROD_REC.CREATION_USER, PROD_REC.CREATION_DATE, (SYS_CONTEXT(CONST_USER, CONST_IP)));
                    END IF;
                ELSE
                    SELECT DB_GENERAL.SEQ_ADMI_PARAMETRO_CAB.NEXTVAL INTO L_ID_PARAMETER
                    FROM DUAL;

                    INSERT INTO DB_GENERAL.ADMI_PARAMETRO_CAB
                    (ID_PARAMETRO, NOMBRE_PARAMETRO, DESCRIPCION, MODULO, PROCESO, ESTADO, USR_CREACION, FE_CREACION, IP_CREACION)
                    VALUES
                    (L_ID_PARAMETER, CONST_WORD_PROD || PROD_REC.CHARNAME, CONST_WORD_PROD || PROD_REC.CHARNAME,
                     'COMERCIAL', NULL, PROD_REC.STATUS, PROD_REC.CREATION_USER, PROD_REC.CREATION_DATE, (SYS_CONTEXT(CONST_USER, CONST_IP)));

                    INSERT INTO DB_GENERAL.ADMI_PARAMETRO_DET
                    (ID_PARAMETRO_DET, PARAMETRO_ID, DESCRIPCION, VALOR1, ESTADO, USR_CREACION, FE_CREACION, IP_CREACION)
                    VALUES
                    (DB_GENERAL.SEQ_ADMI_PARAMETRO_DET.NEXTVAL, L_ID_PARAMETER,
                     CONST_WORD_PROD || PROD_REC.CHARNAME, PROD_REC.VALUE,
                     PROD_REC.STATUS, PROD_REC.CREATION_USER, PROD_REC.CREATION_DATE, (SYS_CONTEXT(CONST_USER, CONST_IP)));
                END IF;
            END LOOP;

            -- Verificar si no se encontró ningún registro
            IF FOUNDELEMENTS = 0 THEN
                DBMS_OUTPUT.PUT_LINE('No se encontró ningún parámetro con los valores indicados.');
            END IF;
        END IF;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Terminando proceso ya que no se encontró un valor de característica válido.');
    END IF;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Proceso completado con éxito.');
END CARGAR_VALOR_CARACTERISTICA;


/**
 * Carga la categoría asociada a un producto específico.
 *
 * @param P_ID_PRODUCTO Número de identificación del producto para asociar categoría.
 * @autor Anderson Parra
 * @version 1.0 12/11/2024
 */
  PROCEDURE CARGAR_CATEG_OFFERING (P_ID_PRODUCTO NUMBER) IS   
    v_ID_PRODUCT_CATALOG NUMBER;
    v_LINEA_NEGOCIO VARCHAR2(255);
    v_GRUPO VARCHAR2(255);
    v_SUBGRUPO VARCHAR2(255);

BEGIN
     FOR rec IN (
      SELECT c.ID_PRODUCT_CATALOG, 
                    c.NAME AS catalogName,
                    g.ID_PRODUCT_CATEGORY, 
                    g.Name AS nameCategory, 
                    g.Description,
                    CONNECT_BY_ROOT g.Name AS root, 
                    LEVEL-1 AS pathlen, 
                    SYS_CONNECT_BY_PATH(g.Name, '->') AS path
                FROM DB_PRODUCT.ADMI_PRODUCT_CATALOG c
                INNER JOIN DB_PRODUCT.ADMI_PROD_CATALOG_RELATED_ORG o 
                    ON o.PRODUCT_CATALOG_ID = c.ID_PRODUCT_CATALOG
                INNER JOIN DB_PRODUCT.ADMI_PRODUCT_CATEGORY g 
                    ON g.PRODUCT_CATALOG_ID = c.ID_PRODUCT_CATALOG
                WHERE o.ORGANIZATION_ID = 10
                START WITH g.ID_PRODUCT_CATEGORY = (
                    SELECT apc.ID_PRODUCT_CATEGORY
                    FROM DB_PRODUCT.ADMI_PRODUCT_CATEGORY apc
                    INNER JOIN DB_PRODUCT.ADMI_PROD_CATEG_OFFERING apco 
                        ON apc.ID_PRODUCT_CATEGORY = apco.PRODUCT_CATEGORY_ID
                    WHERE apco.PRODUCT_OFFERING_ID = P_ID_PRODUCTO
                    AND apco.STATUS = CONST_ESTADO_ACTIVO
                    ORDER BY apco.CREATION_DATE DESC
                    FETCH FIRST ROW ONLY
                )
                CONNECT BY PRIOR g.PARENT_CATEGORY_ID = g.ID_PRODUCT_CATEGORY
          ) LOOP
        -- Depuracion: imprimir valores seleccionados
        DBMS_OUTPUT.PUT_LINE('Seleccionado:');
        DBMS_OUTPUT.PUT_LINE('Root: ' || rec.root);
        DBMS_OUTPUT.PUT_LINE('Pathlen: ' || rec.pathlen);
        DBMS_OUTPUT.PUT_LINE('Path: ' || rec.path);

        -- Asignar valores segUn el Pathlen (nivel de jerarquia)
        CASE rec.pathlen
            WHEN 0 THEN 
                v_SUBGRUPO := rec.nameCategory;  -- Nivel mas bajo
                DBMS_OUTPUT.PUT_LINE('Subgrupo asignado: ' || v_SUBGRUPO);
            WHEN 1 THEN 
                v_GRUPO := rec.nameCategory;     -- Segundo nivel
                DBMS_OUTPUT.PUT_LINE('Grupo asignado: ' || v_GRUPO);
            WHEN 2 THEN 
                v_LINEA_NEGOCIO := rec.nameCategory;  -- Tercer nivel
                DBMS_OUTPUT.PUT_LINE('Linea de negocio asignada: ' || v_LINEA_NEGOCIO);
            ELSE
                -- Valores predeterminados si no se encuentra coincidencia
                v_LINEA_NEGOCIO := 'NA';
                v_GRUPO := NULL;
                v_SUBGRUPO := 'NA';
                DBMS_OUTPUT.PUT_LINE('Valores predeterminados asignados.');
        END CASE;

    END LOOP;

    -- Mostrar valores finales antes de la actualizacion
    DBMS_OUTPUT.PUT_LINE('Actualizando producto con ID: ' || P_ID_PRODUCTO);
    DBMS_OUTPUT.PUT_LINE('Linea de negocio: ' || NVL(v_LINEA_NEGOCIO, 'NA'));
    DBMS_OUTPUT.PUT_LINE('Grupo: ' || NVL(v_GRUPO, 'NULL'));
    DBMS_OUTPUT.PUT_LINE('Subgrupo: ' || NVL(v_SUBGRUPO, 'NA'));

    -- Actualizar los valores en la tabla DB_COMERCIAL.ADMI_PRODUCTO
    UPDATE DB_COMERCIAL.ADMI_PRODUCTO 
    SET LINEA_NEGOCIO = NVL(v_LINEA_NEGOCIO, 'NA'),
        GRUPO = NVL(v_GRUPO, NULL),
        SUBGRUPO = NVL(v_SUBGRUPO, 'NA')
    WHERE ID_PRODUCTO = P_ID_PRODUCTO;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontro ningun producto con el ID proporcionado para actualizar.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Producto actualizado correctamente con la Ultima categoria activa.');
    END IF;

    -- Realizar COMMIT
    COMMIT;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- En caso de no encontrar una categoria activa, asignar valores predeterminados
        UPDATE DB_COMERCIAL.ADMI_PRODUCTO 
        SET LINEA_NEGOCIO = 'NA',
            GRUPO = NULL,
            SUBGRUPO = 'NA'
        WHERE ID_PRODUCTO = P_ID_PRODUCTO;

        IF SQL%ROWCOUNT = 0 THEN
            DBMS_OUTPUT.PUT_LINE('No se encontroningUn producto con el ID proporcionado para actualizar.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('No se encontrocategoria activa, se actualizaron los campos a NULL.');
        END IF;

        -- Realizar COMMIT en caso de excepcion
        COMMIT;
    
END CARGAR_CATEG_OFFERING;


/**
 * Carga el impuesto aplicado a un producto específico.
 *
 * @param P_ID_PRODUCTO_IMPUESTO Número de identificación del impuesto del producto.
 * @autor Anderson Parra
 * @version 1.0 12/11/2024
 */
PROCEDURE CARGAR_PRODUCTO_PRECIO_IMPUESTO(P_ID_PRODUCTO_IMPUESTO NUMBER) IS
    NORECS NUMBER;
    L_ID_PRODUCTO_IMPUESTO NUMBER;
    L_ID_IMPUESTO NUMBER;
    IMPUESTO_EXISTE NUMBER;

    -- Cursor que selecciona los registros activos junto con el PRODUCT_OFFERING_ID
    CURSOR CPROD IS
     SELECT
      p.PRODUCT_OFFERING_ID,
      t.ID_PROD_OFFER_PRICE_TAX_ITEM,
      t.PRODUCT_OFFER_PRICE_ID,
      t.TAX_ID,
      d.VALUE AS TAX_TYPE,
      t.TAX_RATE_APPLIED,
      t.CREATION_DATE,
      t.CREATION_USER,
      t.LAST_UPDATE_DATE,
      t.LAST_UPDATE_USER,
      t.STATUS
    FROM DB_PRODUCT.ADMI_PROD_OFFERING_PRICE p
    INNER JOIN DB_PRODUCT.ADMI_PROD_OFFER_PRICE_TAX_ITEM t ON t.PRODUCT_OFFER_PRICE_ID = p.ID_PROD_OFFERING_PRICE
    INNER JOIN DB_PRODUCT.ADMI_CONFIGURATION_VALUE d ON d.ID_CONFIGURATION_VALUE = t.TAX_ID
    INNER JOIN DB_PRODUCT.ADMI_CONFIGURATION c ON d.CONFIGURATION_ID = c.ID_CONFIGURATION
    WHERE t.ID_PROD_OFFER_PRICE_TAX_ITEM = P_ID_PRODUCTO_IMPUESTO
    AND c.DESCRIPTION = 'TAX_TYPE'
    ORDER BY t.CREATION_DATE DESC, t.LAST_UPDATE_DATE DESC;

    -- Registro para almacenar las filas del cursor
    PROD_REC CPROD%ROWTYPE;

BEGIN
    -- Intentamos abrir el cursor y obtener los datos
    OPEN CPROD;
    FETCH CPROD INTO PROD_REC;

    -- Si se encuentran registros, procedemos a cerrar el cursor y ejecutar el resto del código
    IF CPROD%FOUND THEN
        CLOSE CPROD;

        DBMS_OUTPUT.PUT_LINE('Obtener el ID del impuesto desde la tabla DB_COMERCIAL.ADMI_IMPUESTO');
        
        -- Contamos cuantos registros coinciden con el tipo de impuesto
        SELECT COUNT(*)
        INTO IMPUESTO_EXISTE
        FROM DB_COMERCIAL.ADMI_IMPUESTO
        WHERE TIPO_IMPUESTO = PROD_REC.TAX_TYPE
        AND ESTADO = CONST_ESTADO_ACTIVO;

        -- Si no existe, insertamos un nuevo registro en la tabla de destino
        IF IMPUESTO_EXISTE = 0 THEN
            DBMS_OUTPUT.PUT_LINE('No se encontró el impuesto. Creando uno nuevo.');
            SELECT DB_GENERAL.SEQ_ADMI_IMPUESTO.NEXTVAL
            INTO L_ID_IMPUESTO
            FROM DUAL;

            INSERT INTO DB_COMERCIAL.ADMI_IMPUESTO
                (ID_IMPUESTO, TIPO_IMPUESTO, ESTADO, FE_CREACION, USR_CREACION)
                VALUES
                (L_ID_IMPUESTO, PROD_REC.TAX_TYPE, CONST_ESTADO_ACTIVO, PROD_REC.CREATION_DATE, PROD_REC.CREATION_USER);

            DBMS_OUTPUT.PUT_LINE('Nuevo impuesto creado con ID: ' || L_ID_IMPUESTO);
        ELSE 
            SELECT ID_IMPUESTO
            INTO L_ID_IMPUESTO
            FROM DB_COMERCIAL.ADMI_IMPUESTO
            WHERE TIPO_IMPUESTO = PROD_REC.TAX_TYPE
            AND ESTADO = CONST_ESTADO_ACTIVO;
        END IF;

        DBMS_OUTPUT.PUT_LINE('Verificar si ya existe el registro por ID_PRODUCTO_IMPUESTO y PRODUCTO_ID en la tabla de destino');
        SELECT COUNT(*)
        INTO NORECS
        FROM DB_COMERCIAL.INFO_PRODUCTO_IMPUESTO
        WHERE IMPUESTO_ID = L_ID_IMPUESTO
        AND PRODUCTO_ID = PROD_REC.PRODUCT_OFFERING_ID;

        -- Si ya existe con el mismo ID_PRODUCTO_IMPUESTO y PRODUCTO_ID, actualizamos
        IF NORECS > 0 THEN
            SELECT ID_PRODUCTO_IMPUESTO
            INTO L_ID_PRODUCTO_IMPUESTO
            FROM DB_COMERCIAL.INFO_PRODUCTO_IMPUESTO
            WHERE IMPUESTO_ID = L_ID_IMPUESTO
            AND PRODUCTO_ID = PROD_REC.PRODUCT_OFFERING_ID;

            UPDATE DB_COMERCIAL.INFO_PRODUCTO_IMPUESTO
            SET PRODUCTO_ID = PROD_REC.PRODUCT_OFFERING_ID,
                IMPUESTO_ID = PROD_REC.TAX_ID,
                PORCENTAJE_IMPUESTO = PROD_REC.TAX_RATE_APPLIED,
                FE_ULT_MOD = PROD_REC.LAST_UPDATE_DATE,
                USR_ULT_MOD = PROD_REC.LAST_UPDATE_USER,
                ESTADO = PROD_REC.STATUS
            WHERE ID_PRODUCTO_IMPUESTO = L_ID_PRODUCTO_IMPUESTO;

            DBMS_OUTPUT.PUT_LINE('Registro actualizado con ID_PRODUCTO_IMPUESTO: ' || PROD_REC.ID_PROD_OFFER_PRICE_TAX_ITEM);
        ELSE
            -- Si no existe, insertamos un nuevo registro
            L_ID_PRODUCTO_IMPUESTO := SEQ_INFO_PRODUCTO_IMPUESTO.NEXTVAL;
            INSERT INTO DB_COMERCIAL.INFO_PRODUCTO_IMPUESTO
            (ID_PRODUCTO_IMPUESTO, PRODUCTO_ID, IMPUESTO_ID, 
             PORCENTAJE_IMPUESTO,
             FE_CREACION, USR_CREACION, ESTADO)
            VALUES
            (L_ID_PRODUCTO_IMPUESTO, PROD_REC.PRODUCT_OFFERING_ID, L_ID_IMPUESTO,
             PROD_REC.TAX_RATE_APPLIED,
             PROD_REC.CREATION_DATE, PROD_REC.CREATION_USER, PROD_REC.STATUS);

            DBMS_OUTPUT.PUT_LINE('Registro insertado con nuevo ID_PRODUCTO_IMPUESTO: ' || L_ID_PRODUCTO_IMPUESTO);
        END IF;

    ELSE
        -- Si no se encuentran registros, se imprime el mensaje y se cierra el cursor
        DBMS_OUTPUT.PUT_LINE('No se encontró ningún registro activo para el ID: ' || P_ID_PRODUCTO_IMPUESTO);
        CLOSE CPROD;
    END IF;

    COMMIT;
END CARGAR_PRODUCTO_PRECIO_IMPUESTO;


/**
 * Actualiza la categoría asociada a un producto.
 *
 * @param P_ID_CATEGORIA Número de identificación de la categoría.
 * @autor Anderson Parra
 * @version 1.0 12/11/2024
 */
PROCEDURE ACTUALIZAR_CATEGORIA_ASOCIADA(P_ID_CATEGORIA NUMBER) IS
    v_ID_PRODUCTO NUMBER;
    v_LINEA_NEGOCIO VARCHAR2(255);
    v_GRUPO VARCHAR2(255);
    v_SUBGRUPO VARCHAR2(255);
    v_PATH VARCHAR2(1000);
    v_PATHLEN NUMBER;
    v_ID_SUBGRUPO NUMBER;
    v_SUBGRUPO_RELACION_PRODUCTO NUMBER;
    v_COUNT NUMBER;

    TYPE T_ID_PRODUCTO IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    TYPE T_VALORES IS TABLE OF VARCHAR2(255) INDEX BY PLS_INTEGER;

    l_product_ids T_ID_PRODUCTO;
    l_valores T_VALORES;
    contador INTEGER := 0;

    CURSOR CURSOR_OFERTAS_SUBGRUPO IS
        SELECT apco.PRODUCT_OFFERING_ID
        FROM DB_PRODUCT.ADMI_PROD_CATEG_OFFERING apco
        WHERE apco.PRODUCT_CATEGORY_ID = v_SUBGRUPO_RELACION_PRODUCTO 
        AND apco.STATUS = CONST_ESTADO_ACTIVO;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Inicio del procedimiento ACTUALIZAR_CATEGORIA_ASOCIADA.');

    -- Verificar existencia de la categoría
    SELECT COUNT(*) INTO v_COUNT
    FROM DB_PRODUCT.ADMI_PRODUCT_CATEGORY
    WHERE ID_PRODUCT_CATEGORY = P_ID_CATEGORIA
    AND STATUS = CONST_ESTADO_ACTIVO;

    IF v_COUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró ninguna categoría activa con el ID proporcionado.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Se encontró categoría activa con ID: ' || P_ID_CATEGORIA);

        -- Obtener la jerarquía completa para la categoría y determinar el nivel específico de la categoría proporcionada
        SELECT SYS_CONNECT_BY_PATH(g.Name, '->') AS PATH,
               CASE
                   WHEN g.PARENT_CATEGORY_ID IS NULL THEN 2
                   WHEN g.PARENT_CATEGORY_ID IN (SELECT ID_PRODUCT_CATEGORY FROM DB_PRODUCT.ADMI_PRODUCT_CATEGORY WHERE PARENT_CATEGORY_ID IS NULL) THEN 1
                   ELSE 0
               END AS PATHLEN,
               g.Name,
               g.ID_PRODUCT_CATEGORY,
               (SELECT ID_PRODUCT_CATEGORY
                FROM DB_PRODUCT.ADMI_PRODUCT_CATEGORY
                WHERE STATUS = CONST_ESTADO_ACTIVO
                  AND CONNECT_BY_ISLEAF = 1
                START WITH ID_PRODUCT_CATEGORY = g.ID_PRODUCT_CATEGORY
                CONNECT BY PRIOR ID_PRODUCT_CATEGORY = PARENT_CATEGORY_ID
                FETCH FIRST ROW ONLY) AS SUBGRUPO_PRODUCTO_RELACIONADO_ID
        INTO v_PATH, v_PATHLEN, v_LINEA_NEGOCIO, v_ID_SUBGRUPO, v_SUBGRUPO_RELACION_PRODUCTO
        FROM DB_PRODUCT.ADMI_PRODUCT_CATEGORY g
        WHERE g.STATUS = CONST_ESTADO_ACTIVO
        START WITH g.ID_PRODUCT_CATEGORY = P_ID_CATEGORIA
        CONNECT BY NOCYCLE PRIOR g.ID_PRODUCT_CATEGORY = g.PARENT_CATEGORY_ID
        ORDER BY LEVEL ASC
        FETCH FIRST ROW ONLY;

        -- Asignar valores según el nivel de jerarquía (PATHLEN)
        CASE v_PATHLEN
            WHEN 2 THEN
                DBMS_OUTPUT.PUT_LINE('Nombre de LINEA_NEGOCIO encontrado: ' || v_LINEA_NEGOCIO);
            WHEN 1 THEN
                v_GRUPO := v_LINEA_NEGOCIO;
                DBMS_OUTPUT.PUT_LINE('Nombre de GRUPO encontrado: ' || v_GRUPO);
            WHEN 0 THEN
                v_SUBGRUPO := v_LINEA_NEGOCIO;
                DBMS_OUTPUT.PUT_LINE('Nombre de SUBGRUPO encontrado: ' || v_SUBGRUPO);
            ELSE
                DBMS_OUTPUT.PUT_LINE('Advertencia: v_PATHLEN tiene un valor inesperado: ' || v_PATHLEN);
        END CASE;

        -- Recolectar IDs de productos y valores correspondientes
        IF v_SUBGRUPO_RELACION_PRODUCTO IS NOT NULL THEN
            OPEN CURSOR_OFERTAS_SUBGRUPO;
            LOOP
                FETCH CURSOR_OFERTAS_SUBGRUPO INTO v_ID_PRODUCTO;
                EXIT WHEN CURSOR_OFERTAS_SUBGRUPO%NOTFOUND;

                contador := contador + 1;
                l_product_ids(contador) := v_ID_PRODUCTO;

                CASE v_PATHLEN
                    WHEN 2 THEN
                        l_valores(contador) := v_LINEA_NEGOCIO;
                    WHEN 1 THEN
                        l_valores(contador) := v_GRUPO;
                    WHEN 0 THEN
                        l_valores(contador) := v_SUBGRUPO;
                END CASE;

            END LOOP;
            CLOSE CURSOR_OFERTAS_SUBGRUPO;

            -- Realizar la actualización masiva usando FORALL
            IF contador > 0 THEN
              BEGIN
                  CASE v_PATHLEN
                      WHEN 2 THEN
                          FORALL i IN 1..contador SAVE EXCEPTIONS
                              UPDATE DB_COMERCIAL.ADMI_PRODUCTO
                              SET LINEA_NEGOCIO = l_valores(i)
                              WHERE ID_PRODUCTO = l_product_ids(i);
                      WHEN 1 THEN
                          FORALL i IN 1..contador SAVE EXCEPTIONS
                              UPDATE DB_COMERCIAL.ADMI_PRODUCTO
                              SET GRUPO = l_valores(i)  
                              WHERE ID_PRODUCTO = l_product_ids(i);
                      WHEN 0 THEN
                          FORALL i IN 1..contador SAVE EXCEPTIONS
                              UPDATE DB_COMERCIAL.ADMI_PRODUCTO
                              SET SUBGRUPO = l_valores(i)                                                                                                         
                              WHERE ID_PRODUCTO = l_product_ids(i);
                  END CASE;

                  DBMS_OUTPUT.PUT_LINE('Actualización masiva completada para los productos.');

              EXCEPTION
                  WHEN OTHERS THEN                      
                  -- Recorrer todos los errores individuales en el FORALL usando un WHILE
                  DECLARE
                    i INTEGER := 1;
                  BEGIN
                    WHILE i <= SQL%BULK_EXCEPTIONS.COUNT LOOP
                      DBMS_OUTPUT.PUT_LINE('Error en el índice: ' || SQL%BULK_EXCEPTIONS(i).ERROR_INDEX || 
                                          ', Código de error: ' || SQL%BULK_EXCEPTIONS(i).ERROR_CODE || 
                                          ', Mensaje: ' || SQLERRM(SQL%BULK_EXCEPTIONS(i).ERROR_CODE));
                      -- Aquí puedes agregar lógica adicional para registrar los errores en una tabla de logs
                      i := i + 1;
                    END LOOP;
                   END;
              END;
          ELSE
              DBMS_OUTPUT.PUT_LINE('No se encontraron registros para actualizar.');
          END IF;
        ELSE
            DBMS_OUTPUT.PUT_LINE('No se encontró un SUBGRUPO asociado para actualizar productos.');
        END IF;
    END IF;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Procedimiento ACTUALIZAR_CATEGORIA_ASOCIADA completado exitosamente.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontraron datos con los criterios proporcionados.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END ACTUALIZAR_CATEGORIA_ASOCIADA;

/**
 * Lista las características de un producto específico.
 *
 * @param P_ID_CARACTERISTICA_PRODUCTO Número de identificación de la característica del producto.
 * @param P_ID_PRODUCT_OFFERING Número de identificación del producto.
 * @autor Anderson Parra
 * @version 1.0 12/11/2024
 */
PROCEDURE LISTAR_PRODUCTO_CARACTERISTICAS (P_ID_CARACTERISTICA_PRODUCTO NUMBER, P_ID_PRODUCT_OFFERING NUMBER) IS
    CURSOR CPROD IS
        SELECT o.ID_PRODUCT_OFFERING, o.NAME,
               e.ID_PRODUCT_SPECIFICATION, e.NAME AS SPECNAME,
               c.ID_PROD_SPEC_CHARACTERISTIC, c.NAME AS CHARNAME,
               CASE c.VALUE_TYPE
                   WHEN 'TEXTO' THEN 'T'
                   WHEN 'LISTA' THEN 'S'
                   WHEN 'ENTERO' THEN 'N'
                   WHEN 'DECIMAL' THEN 'N'
                   WHEN 'BOOLEAN' THEN 'O'
                   ELSE 'C'
               END AS VALUE_TYPE,
               c.DESCRIPTION,
               CASE c.IS_VISIBLE
                   WHEN 0 THEN 'NO'
                   WHEN 1 THEN 'SI'
                   ELSE 'NO'
               END AS VISIBLE,
               c.STATUS AS CHARSTATUS, c.CREATION_DATE, c.CREATION_USER
        FROM DB_PRODUCT.ADMI_PRODUCT_OFFERING o
        INNER JOIN DB_PRODUCT.ADMI_PRODUCT_SPECIFICATION e ON e.ID_PRODUCT_SPECIFICATION = o.PRODUCT_SPECIFICATION_ID
        INNER JOIN DB_PRODUCT.ADMI_PROD_SPEC_CHARACTERISTIC c ON c.PRODUCT_SPECIFICATION_ID = e.ID_PRODUCT_SPECIFICATION
        WHERE c.ID_PROD_SPEC_CHARACTERISTIC = P_ID_CARACTERISTICA_PRODUCTO
        AND o.ID_PRODUCT_OFFERING = P_ID_PRODUCT_OFFERING
        ORDER BY c.CREATION_DATE DESC, c.LAST_UPDATE_DATE DESC;

BEGIN
    FOR PROD_REC IN CPROD LOOP
        DBMS_OUTPUT.PUT_LINE('Procesando producto: ' || PROD_REC.NAME || 
                             ' con ID de caracteristica ' || PROD_REC.ID_PROD_SPEC_CHARACTERISTIC);
        -- Llamada al procedimiento para verificar o crear la caracteristica
        CARGAR_CARACTERISTICA(P_ID_CARACTERISTICA_PRODUCTO);
    END LOOP;
END LISTAR_PRODUCTO_CARACTERISTICAS;

/**
 * Carga un valor técnico para una característica específica.
 *
 * @param P_ID_VALUE Número de identificación del valor de la característica.
 * @param P_ID_CHARACTERISTIC Número de identificación de la característica.
 * @autor Anderson Parra
 * @version 1.0 12/11/2024
 */
PROCEDURE CARGAR_VALOR_CARACTERISTICA_NOMBRE_TECNICO(P_ID_VALUE NUMBER, P_ID_CHARACTERISTIC NUMBER) IS
  CURSOR valore_tipo_nombre_tecnico IS
    SELECT o.ID_PRODUCT_OFFERING AS PRODUCT_ID,
           o.NAME AS NAME_PRODUCT,
           e.NAME AS SPECNAME,
           c.ID_PROD_SPEC_CHARACTERISTIC AS ID_CHARACTERISTIC,
           v.ID_PROD_SPEC_CHAR_VALUE AS ID_VALUE,
           v.VALUE,
           v.STATUS AS STATUS_VALUE,
           c.STATUS AS STATUS_CHARACTERISTIC
    FROM DB_PRODUCT.ADMI_PRODUCT_OFFERING o
    INNER JOIN DB_PRODUCT.ADMI_PRODUCT_SPECIFICATION e ON e.ID_PRODUCT_SPECIFICATION = o.PRODUCT_SPECIFICATION_ID
    INNER JOIN DB_PRODUCT.ADMI_PROD_SPEC_CHARACTERISTIC c ON c.PRODUCT_SPECIFICATION_ID = e.ID_PRODUCT_SPECIFICATION
    INNER JOIN DB_PRODUCT.ADMI_PROD_SPEC_CHAR_VALUE v ON v.PRODUCT_SPEC_CHAR_ID = c.ID_PROD_SPEC_CHARACTERISTIC 
      AND v.PRODUCT_SPECIFICATION_ID = c.PRODUCT_SPECIFICATION_ID
    LEFT JOIN DB_PRODUCT.INFO_PROD_OFFER_SPEC_CHAR_VALUE_USE u ON u.PRODUCT_OFFER_ID = o.ID_PRODUCT_OFFERING 
      AND u.PRODUCT_SPEC_CHAR_VALUE_ID = v.ID_PROD_SPEC_CHAR_VALUE
    WHERE (v.ID_PROD_SPEC_CHAR_VALUE = P_ID_VALUE OR c.ID_PROD_SPEC_CHARACTERISTIC = P_ID_CHARACTERISTIC)
    AND c.IS_UNIQUE = 1
    AND c.NAME = CONST_NOMBRE_TECNICO
    AND e.STATUS = CONST_ESTADO_ACTIVO
    ORDER BY v.CREATION_DATE DESC, v.LAST_UPDATE_DATE DESC;

  TYPE T_ID_PRODUCTO IS TABLE OF DB_COMERCIAL.ADMI_PRODUCTO.ID_PRODUCTO%TYPE INDEX BY PLS_INTEGER;
  TYPE T_NOMBRE_TECNICO IS TABLE OF DB_COMERCIAL.ADMI_PRODUCTO.NOMBRE_TECNICO%TYPE INDEX BY PLS_INTEGER;

  l_product_ids T_ID_PRODUCTO;
  l_nombres_tecnicos T_NOMBRE_TECNICO;

  contador INTEGER := 0;

BEGIN
  DBMS_OUTPUT.PUT_LINE('Iniciando procedimiento CARGAR_VALOR_CARACTERISTICA_NOMBRE_TECNICO...');

  -- Recolectar los datos necesarios en colecciones
  FOR n_tecnico IN valore_tipo_nombre_tecnico LOOP
    contador := contador + 1;
    l_product_ids(contador) := n_tecnico.PRODUCT_ID;
    
    IF n_tecnico.STATUS_VALUE = CONST_ESTADO_ACTIVO AND n_tecnico.STATUS_CHARACTERISTIC <> CONST_ESTADO_ANULADO THEN
      l_nombres_tecnicos(contador) := n_tecnico.VALUE;
      DBMS_OUTPUT.PUT_LINE('NOMBRE_TECNICO encontrado (Activo): ' || n_tecnico.VALUE);
    ELSE
      l_nombres_tecnicos(contador) := 'OTROS';
      DBMS_OUTPUT.PUT_LINE('NOMBRE_TECNICO encontrado (Estado no Activo, Estado Anulado, o característica Anulada), se cambiará a OTROS.');
    END IF;
  END LOOP;

  -- Validación si existen datos a actualizar
   IF contador > 0 THEN
    BEGIN
      -- Aplicar la actualización masiva usando FORALL con SAVE EXCEPTIONS
      FORALL i IN 1..contador SAVE EXCEPTIONS
        UPDATE DB_COMERCIAL.ADMI_PRODUCTO
        SET NOMBRE_TECNICO = l_nombres_tecnicos(i)
        WHERE ID_PRODUCTO = l_product_ids(i);

      DBMS_OUTPUT.PUT_LINE('Actualización masiva de NOMBRE_TECNICO completada.');

    EXCEPTION
      WHEN OTHERS THEN
        -- Recorrer todos los errores individuales en el FORALL usando un WHILE
        DECLARE
          i INTEGER := 1;
        BEGIN
          WHILE i <= SQL%BULK_EXCEPTIONS.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE('Error en el índice: ' || SQL%BULK_EXCEPTIONS(i).ERROR_INDEX || 
                                ', Código de error: ' || SQL%BULK_EXCEPTIONS(i).ERROR_CODE || 
                                ', Mensaje: ' || SQLERRM(SQL%BULK_EXCEPTIONS(i).ERROR_CODE));
            -- Aquí puedes agregar lógica adicional para registrar los errores en una tabla de logs
            i := i + 1;
          END LOOP;
        END;
    END;
  ELSE
    DBMS_OUTPUT.PUT_LINE('No se encontraron registros para actualizar NOMBRE_TECNICO.');
  END IF;

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Finalizando procedimiento CARGAR_VALOR_CARACTERISTICA_NOMBRE_TECNICO.');

END CARGAR_VALOR_CARACTERISTICA_NOMBRE_TECNICO;



/**
 * Carga las características asociadas a un servicio específico.
 *
 * @param P_ID_CARACTERISTICA_PRODUCTO Número de identificación de la característica del producto.
 * @autor Anderson Parra
 * @version 1.0 12/11/2024
 */
PROCEDURE CARGAR_CARACTERISTICAS_SERVICIOS(P_ID_CARACTERISTICA_PRODUCTO NUMBER) IS
    L_ID_CARACTERISTICA VARCHAR2(40);
BEGIN
    FOR rec IN (
      SELECT 
      (SELECT o.ID_PRODUCT_OFFERING 
      FROM DB_PRODUCT.ADMI_PRODUCT_OFFERING o
      WHERE o.PRODUCT_SPECIFICATION_ID = c.PRODUCT_SPECIFICATION_ID
      AND o.STATUS = 'Activo'
      FETCH FIRST 1 ROWS ONLY) AS L_ID_PRODUCT,
      c.ID_PROD_SPEC_CHARACTERISTIC AS L_ID_CHARACTERISTIC,
      v.VALUE AS L_CHARACTERISTIC_NAME,
      c.CREATION_USER AS L_CreationUser,
      c.STATUS AS L_STATUS
      FROM DB_PRODUCT.ADMI_CONFIGURATION f
      INNER JOIN DB_PRODUCT.ADMI_CONFIGURATION_VALUE v 
      ON v.CONFIGURATION_ID = f.ID_CONFIGURATION
      INNER JOIN DB_PRODUCT.ADMI_PROD_SPEC_CHARACTERISTIC c 
      ON c.NAME = v.VALUE
      WHERE f.DESCRIPTION = 'CARACTERISTICA_SERVICIO'
      AND v.VALUE NOT IN (CONST_NOMBRE_TECNICO)
      AND f.STATUS = CONST_ESTADO_ACTIVO
      AND v.STATUS = CONST_ESTADO_ACTIVO
      AND c.STATUS = CONST_ESTADO_ACTIVO
      AND c.ID_PROD_SPEC_CHARACTERISTIC = P_ID_CARACTERISTICA_PRODUCTO
      ORDER BY v.CREATION_DATE DESC, v.LAST_UPDATE_DATE DESC
    ) LOOP
        -- Obtener el ID de la caracteristica
        L_ID_CARACTERISTICA := OBTENER_ID_CARACTERISTICA(rec.L_CHARACTERISTIC_NAME);

        -- Llamada a INSERTAR_CARACTERISTICA_PRODUCTO si L_ID_CARACTERISTICA no es NULL
        IF L_ID_CARACTERISTICA IS NOT NULL THEN
            INSERTAR_CARACTERISTICA_PRODUCTO(
                rec.L_CHARACTERISTIC_NAME,   
                rec.L_ID_PRODUCT,            
                L_ID_CARACTERISTICA,                         
                rec.L_CreationUser,          
                rec.L_STATUS,                   
                'SI'                         
            );
        END IF;
    END LOOP;
END CARGAR_CARACTERISTICAS_SERVICIOS;

/**
 * Inserta una nueva característica para un producto específico.
 *
 * @param V_CHARNAME Nombre de la característica.
 * @param P_PRODUCT_ID Número de identificación del producto.
 * @param P_CARACTERISTICA_ID Número de identificación de la característica.
 * @param P_CREATION_USER Usuario que crea la característica.
 * @param P_CHARSTATUS Estado de la característica.
 * @param P_VISIBLE Indicador de visibilidad de la característica.
 * @autor Anderson Parra
 * @version 1.0 12/11/2024
 */
PROCEDURE INSERTAR_CARACTERISTICA_PRODUCTO(
    V_CHARNAME VARCHAR2,
    P_PRODUCT_ID NUMBER,
    P_CARACTERISTICA_ID NUMBER,
    P_CREATION_USER VARCHAR2,
    P_CHARSTATUS VARCHAR2,
    P_VISIBLE VARCHAR2
) IS
    NORECS_P_C NUMBER;
    NEW_ID_PRODUCTO_CARACTERISTICA NUMBER;
    v_producto_exists NUMBER;
    v_caracteristica_exists NUMBER;
BEGIN
    -- Verificar si el PRODUCTO_ID existe en la tabla de productos
    SELECT COUNT(*)
    INTO v_producto_exists
    FROM DB_COMERCIAL.ADMI_PRODUCTO
    WHERE ID_PRODUCTO = P_PRODUCT_ID;

    IF v_producto_exists = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Aviso: El PRODUCTO_ID ' || P_PRODUCT_ID || ' no existe en la tabla ADMI_PRODUCTO. Continuando con el siguiente producto.');
    ELSE
        -- Verificar si el CARACTERISTICA_ID existe en la tabla de características
        SELECT COUNT(*)
        INTO v_caracteristica_exists
        FROM DB_COMERCIAL.ADMI_CARACTERISTICA
        WHERE ID_CARACTERISTICA = P_CARACTERISTICA_ID;

        IF v_caracteristica_exists = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Aviso: El CARACTERISTICA_ID ' || P_CARACTERISTICA_ID || ' no existe en la tabla ADMI_CARACTERISTICA. Continuando con el siguiente producto.');
        ELSE
            -- Verificar si la característica ya está en ADMI_PRODUCTO_CARACTERISTICA
            SELECT COUNT(*)
            INTO NORECS_P_C
            FROM DB_COMERCIAL.ADMI_PRODUCTO_CARACTERISTICA apc
            INNER JOIN DB_COMERCIAL.ADMI_CARACTERISTICA ac ON ac.ID_CARACTERISTICA = apc.CARACTERISTICA_ID
            WHERE apc.PRODUCTO_ID = P_PRODUCT_ID
            AND ac.DESCRIPCION_CARACTERISTICA = V_CHARNAME
            AND apc.ESTADO = CONST_ESTADO_ACTIVO;

            IF NORECS_P_C = 0 THEN
                -- Insertar nueva característica si no existe
                SELECT DB_COMERCIAL.SEQ_ADMI_PRODUCTO_CARAC.NEXTVAL
                INTO NEW_ID_PRODUCTO_CARACTERISTICA
                FROM DUAL;

                -- Imprimir los valores que serán insertados
                DBMS_OUTPUT.PUT_LINE('Valores que se insertarán en ADMI_PRODUCTO_CARACTERISTICA:');
                DBMS_OUTPUT.PUT_LINE('ID_PRODUCTO_CARACTERISTICA: ' || NEW_ID_PRODUCTO_CARACTERISTICA);
                DBMS_OUTPUT.PUT_LINE('PRODUCTO_ID: ' || P_PRODUCT_ID);
                DBMS_OUTPUT.PUT_LINE('CARACTERISTICA_ID: ' || P_CARACTERISTICA_ID);

                -- Realizar el INSERT después de imprimir los valores
                INSERT INTO DB_COMERCIAL.ADMI_PRODUCTO_CARACTERISTICA
                (ID_PRODUCTO_CARACTERISITICA, PRODUCTO_ID, CARACTERISTICA_ID, FE_CREACION, USR_CREACION, ESTADO, VISIBLE_COMERCIAL)
                VALUES
                (NEW_ID_PRODUCTO_CARACTERISTICA, P_PRODUCT_ID, P_CARACTERISTICA_ID, SYSDATE, P_CREATION_USER, P_CHARSTATUS, P_VISIBLE);

                DBMS_OUTPUT.PUT_LINE('Nueva característica creada para el producto con ID: ' || P_PRODUCT_ID);
            ELSE
                DBMS_OUTPUT.PUT_LINE('La característica ya está asociada al producto con ID: ' || P_PRODUCT_ID);
            END IF;
        END IF;
    END IF;
END INSERTAR_CARACTERISTICA_PRODUCTO;


END PKS_REPLICAR_PRODUCTOS;

/