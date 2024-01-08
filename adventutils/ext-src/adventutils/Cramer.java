package adventutils;

import adventutils.maths.Rational;

public class Cramer {

	Rational[][] A;
	Rational[] B;
	int size;

	public Cramer() {
		A = null;
		B = null;
		size = 0;
	}

	public Cramer(Rational[][] m2, Rational[] x) {
		this.A = m2;
		this.B = x;
		this.size = x.length;
	}

	public Rational[] solve() {
		Rational[][] tempMatrix = new Rational[size][size];
		Rational[] x = new Rational[size];

		Rational detCohef = this.calculateCoeficientsMatrixDeterminant();

		for (int i = 0; i < size; i++) {
			for (int k = 0; k < size; k++) {
				for (int l = 0; l < size; l++) {
					tempMatrix[k][l] = A[k][l];
				}
			}
			for (int k = 0; k < size; k++) {
				tempMatrix[k][i] = B[k];
			}
			Rational det = this.calculateDeterminant(tempMatrix, size);
			x[i] = det.operator_divide(detCohef);
		}
		return x;
	}

	public Rational calculateCoeficientsMatrixDeterminant() {
		return calculateDeterminant(this.A, this.size);
	}

	public Rational calculateDeterminant(Rational[][] m, int sizeM) {
		if (sizeM == 1) {
			return m[0][0];
		} else if (sizeM == 2) {
			// You should save a lot of recursive calls by calculating
			// a 2x2 determinant here
			return m[0][0].operator_multiply(m[1][1]).operator_minus(m[0][1].operator_multiply(m[1][0]));
		} else {
			Rational sum = Rational.ZERO;
			Rational multiplier = Rational.ONE.negate();
			for (int i = 0; i < sizeM; i++) {
				multiplier.negate() ;
				Rational[][] nM = this.copyMatrix(m, sizeM, i);
				Rational det = multiplier.operator_multiply(m[0][i]).operator_minus(calculateDeterminant(nM, sizeM - 1));
				sum = det.operator_plus(sum);
			}
			return sum;
		}
	}

	public Rational[][] copyMatrix(Rational[][] m, int size, int col) {
		int sizeM = size - 1;
		Rational[][] result = new Rational[sizeM][sizeM];
		int nI = 0;
		for (int i = 1; i < size; i++) {
			int nJ = 0;
			for (int j = 0; j < size; j++) {
				if (j != col) {
					result[nI][nJ] = m[i][j];
					nJ++;
				}
			}
			nI++;
		}
		return result;
	}

}
